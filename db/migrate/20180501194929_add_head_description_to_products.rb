class AddHeadDescriptionToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :head_description, :string
  end
end
