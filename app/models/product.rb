class Product < ApplicationRecord
  has_many :order_items
  mount_uploader :product_image, ProductImageUploader
  default_scope { where(active: true) }
end
