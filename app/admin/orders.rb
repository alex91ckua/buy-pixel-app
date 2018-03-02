ActiveAdmin.register Order do

  actions :all, except: [:destroy, :new, :create]
  remove_filter :order_items, :updated_at
  permit_params :sponsor_name, :order_status

end
