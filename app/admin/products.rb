ActiveAdmin.register Product do
  actions :all, except: [:destroy, :new, :create]
  remove_filter :order_items, :updated_at
  permit_params :name, :active, :price, :in_stock, :from_date, :to_date
end
