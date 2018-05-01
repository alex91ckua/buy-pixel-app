class AddHeadline1ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :headline_1, :string
  end
end
