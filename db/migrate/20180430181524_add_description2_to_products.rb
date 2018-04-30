class AddDescription2ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :description_2, :text
  end
end
