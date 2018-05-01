class AddVideoToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :video, :string
  end
end
