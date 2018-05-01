class AddHeadline2ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :headline_2, :string
  end
end
