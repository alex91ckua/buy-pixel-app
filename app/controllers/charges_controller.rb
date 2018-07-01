require 'paypal-sdk-rest'

class ChargesController < ApplicationController
  before_action :cart_exist, only: [:new, :create]

  def execute
    payment = PayPal::SDK::REST::DataTypes::Payment.find(params[:paymentId])
    if payment.execute(payer_id: params[:PayerID])
      @transaction_id = params[:paymentId]
      payer = payment.payer
      @billing_name = "#{payer.payer_info.first_name} #{payer.payer_info.last_name}"
      complete_order
      redirect_to charge_success_path
    else
      # Error Hash
      flash[:danger] = payment.error
      redirect_to new_charge_path
    end
  end

  def create

    # PayPal::SDK::REST.set_config(
    #     :mode => "sandbox", # "sandbox" or "live"
    #     :client_id => "EBWKjlELKMYqRNQ6sYvFo64FtaRLRR5BdHEESmha49TM",
    #     :client_secret => "EO422dn3gQLgDbuwqTjzrFgFtaRLRR5BdHEESmha49TM")

    # Build Payment object
    amount = ActionController::Base.helpers.number_with_precision(current_order.total, precision: 2)
    @payment = PayPal::SDK::REST::DataTypes::Payment.new(
      intent:  'sale',
      payer:  {
        payment_method:  'paypal'
      },
      redirect_urls: {
        return_url: charge_execute_url,
        cancel_url: root_url
      },
      transactions: [{
        amount: {
          total:  amount,
          currency: 'USD'
        }
      }]
    )

    if @payment.create
      redirect_url = @payment.links.find{|v| v.method == 'REDIRECT' }.href
      redirect_to redirect_url
    else
      # @payment.error  # Error Hash
      flash[:danger] = @payment.error
      redirect_to new_charge_path
    end
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
