class AddCustomPixelPercentageToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :custom_pixel_percentage, :integer
  end
end
