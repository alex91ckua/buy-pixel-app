class AddColumnInStockToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :in_stock, :integer, after: 'price'
  end
end
