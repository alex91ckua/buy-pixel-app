class AddSlider2Image1ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :slider_2_image_1, :string
  end
end
