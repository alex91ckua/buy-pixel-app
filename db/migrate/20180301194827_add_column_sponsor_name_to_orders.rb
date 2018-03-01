class AddColumnSponsorNameToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :sponsor_name, :string
  end
end
