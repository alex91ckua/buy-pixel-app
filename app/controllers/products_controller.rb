class ProductsController < ApplicationController

  def index
    # page
  end

  def show
    @order_item = current_order.order_items.new
    @pixel_product = Product.find(params[:id])
    @days_left = (@pixel_product.to_date - Time.now.to_date).to_i

    # calculate percent of purchased
    total_products = @pixel_product.item_purchased + @pixel_product.in_stock
    @collected_percentage = (@pixel_product.item_purchased * 100) / total_products

    @collected_percentage = @pixel_product.custom_pixel_percentage if @pixel_product.custom_pixel_percentage

    @latest_orders = Order.order('created_at DESC').where(order_status: Order.order_statuses[:placed]).limit(18)

    if I18n.locale == :en
      @description_1 = @pixel_product.description_1
      @description_2 = @pixel_product.description_2
    else
      @description_1 = @pixel_product.description_1_ar
      @description_2 = @pixel_product.description_2_ar
    end


  end
end
