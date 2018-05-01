class Product < ApplicationRecord
  has_many :order_items
  mount_uploader :product_image, ProductImageUploader
  mount_uploader :slider_1_image_1, ProductImageUploader
  mount_uploader :slider_1_image_2, ProductImageUploader
  mount_uploader :slider_1_image_3, ProductImageUploader
  mount_uploader :slider_2_image_1, ProductImageUploader
  mount_uploader :slider_2_image_2, ProductImageUploader
  mount_uploader :slider_2_image_3, ProductImageUploader
  mount_uploader :video, VideoUploader
  validates :name, presence: true
  validates :money_goal, presence: true
  validates :product_image, presence: true
  validates :description_1, presence: true
  validates :description_2, presence: true
  validates :description_1_ar, presence: true
  validates :description_2_ar, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :in_stock, presence: true
  validates_inclusion_of :custom_pixel_percentage, in: 0..100, allow_blank: true
  default_scope { where(active: true) }
  after_initialize :init

  def init
    self.money_collected = 0
    self.item_purchased = 0
  end
end
