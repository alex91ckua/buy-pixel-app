class AddSlider2Image3ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :slider_2_image_3, :string
  end
end
