class AddSlider1Image2ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :slider_1_image_2, :string
  end
end
