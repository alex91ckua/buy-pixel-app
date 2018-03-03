class ChargesController < ApplicationController
  before_action :cart_exist, only: [:new, :create]

  def create

    customer = Stripe::Customer.create( :email => params[:stripeEmail],
                                        :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create( :customer    => customer.id,
                                    :amount      => current_order.total_cents, # Amount in cents
                                    :description => 'Al-Ihsan Order',
                                    :currency    => 'aud')
    @transaction_id = charge.id
    @billing_name = params[:stripeBillingName]
    complete_order
    redirect_to charge_success_path

  rescue Stripe::CardError => e
    flash[:danger] = e.message
    redirect_to new_charge_path
  end

  def success
    redirect_to root_path unless session[:success]
  end

  private

  def complete_order
    current_order.update_attributes(  :order_status_id => 2,
                                      :transaction_id => @transaction_id,
                                      :sponsor_name => @billing_name)
    update_product_info
    session.delete(:order_id)
    session[:success] = true
  end

  def update_product_info
    current_order.order_items.each do |oi|
      product = Product.find_by_id(oi.product_id)
      # let's decrease stock qty and change money_collected of products
      in_stock = product.in_stock - oi.quantity
      item_purchased = product.item_purchased + oi.quantity
      money_collected = current_order.subtotal + product.money_collected
      product.update_attributes(  :in_stock => in_stock,
                                  :money_collected => money_collected,
                                  :item_purchased => item_purchased)
    end
  end

  def cart_exist
    redirect_to root_path unless session[:order_id]
  end

end
