class AddDescription1ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :description_1, :text
  end
end
