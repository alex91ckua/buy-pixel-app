ActiveAdmin.register Product do
  actions :all, except: [:destroy, :new, :create]
  remove_filter :order_items, :updated_at
  permit_params :name, :active, :price, :money_goal, :in_stock, :from_date, :to_date, :product_image

  form(:html => { :multipart => true }) do |f|
    f.inputs "Product" do
      f.input :name
      f.input :active
      f.input :price
      f.input :money_goal
      f.input :in_stock
      f.input :from_date
      f.input :to_date
      f.input :product_image, :as => :file
    end
    f.button 'Update'
  end

  # show do
  #   attributes_table do
  #     row :name
  #     row :total
  #     row :product_image do
  #       image_tag(object.url)
  #     end
  #   end
  # end

end
