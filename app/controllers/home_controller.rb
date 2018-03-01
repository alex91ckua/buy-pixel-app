class HomeController < ApplicationController
  def index
    @order_item = current_order.order_items.new
  end
end
