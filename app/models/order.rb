class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items, :dependent => :destroy
  enum order_status: { in_progress: 1, placed: 2, canceled: 3 }
  # before_validation :set_order_status, on: :create
  before_save :update_subtotal
  before_save :update_total
  before_save :update_total_cents
  validate :validate_order_items


  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def calc_total
    tax_percent = 0 # Tax in percent
    if tax_percent.zero?
      total = subtotal
    else
      coefficient = (subtotal / 100)
      tax_sum = coefficient * tax_percent
      total = subtotal + tax_sum
    end
    total
  end

  # destroy all in_progress orders which was created more than 1 day ago
  def self.clean_in_progress_orders
    Order.where("created_at < :day AND order_status_id = :in_progress", {:day => 1.day.ago, :in_progress => 1}).destroy_all
  end

  private

  def validate_order_items
    order_items.each do |oi|
        next if oi.valid?
        oi.errors.full_messages.each do |msg|
          errors.add(:base, "Item Error: #{msg}")
        end
      end
  end

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_total
    self[:total] = calc_total
  end

  def update_total_cents
    self[:total_cents] = total * 100.round
  end

end
