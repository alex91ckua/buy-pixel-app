class HomeController < ApplicationController
  def index
    @order_item = current_order.order_items.new
    @pixel_product = Product.find(1) # by id
    @days_left = (@pixel_product.to_date - Time.now.to_date).to_i

    # calculate percent of purchased
    total_products = @pixel_product.item_purchased + @pixel_product.in_stock
    @collected_percentage = (@pixel_product.item_purchased * 100) / total_products

    @latest_orders = Order.order('created_at DESC').where(order_status_id: 2).limit(18)

    @footer_text = Setting.footer_text.gsub(/[\r\n]+/, "<br><br>")
  end
end
