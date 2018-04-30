class AddArabicDescription2ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :description_2_ar, :text
  end
end
