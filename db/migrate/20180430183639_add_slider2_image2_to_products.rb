class AddSlider2Image2ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :slider_2_image_2, :string
  end
end
