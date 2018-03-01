class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order_item = @order.order_items.find_or_initialize_by(product_id: params[:order_item][:product_id])
    @order_item.update_attributes(order_item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to_cart
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items

    redirect_to_cart
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items

    redirect_to_cart
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  def redirect_to_cart
    redirect_to cart_path
  end
end
