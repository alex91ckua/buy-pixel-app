class ChargesController < ApplicationController

  def new
  end

  def create

    customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => total_amount, # Amount in cents
        :description => 'Rails Stripe customer',
        :currency    => 'aud'
    )

    redirect_to charge_success_path

  rescue Stripe::CardError => e
    flash[:danger] = e.message
    redirect_to new_charge_path
  end

end
