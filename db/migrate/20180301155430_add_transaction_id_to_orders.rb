class AddTransactionIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :transaction_id, :string
  end
end
