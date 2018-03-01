class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items
  before_validation :set_order_status, on: :create
  before_save :update_subtotal
  before_save :update_total
  before_save :update_total_cents

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
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

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_total
    self[:total] = total
  end

  def update_total_cents
    self[:total_cents] = total * 100.round
  end
end
