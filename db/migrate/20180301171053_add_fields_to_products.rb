class AddFieldsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :money_collected, :decimal, precision: 12, scale: 3
    add_column :products, :money_goal, :decimal, precision: 12, scale: 3
    add_column :products, :item_purchased, :integer
    add_column :products, :from_date, :date
    add_column :products, :to_date, :date
  end
end
