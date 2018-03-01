class AddTotalCentsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :total_cents, :integer
  end
end
