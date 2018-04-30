class AddSlider1Image3ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :slider_1_image_3, :string
  end
end
