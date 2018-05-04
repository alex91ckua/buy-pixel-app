class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def set_admin_locale
    I18n.locale = :en
  end

  helper_method :current_order

  def current_order
    if !session[:order_id].nil? && Order.exists?(session[:order_id])
      Order.find(session[:order_id])
    else
      order = Order.new
      order.order_status_id = Order.order_statuses[:in_progress]
      order
    end
  end

end
