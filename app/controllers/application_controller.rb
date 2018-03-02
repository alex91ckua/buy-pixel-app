class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order
  helper_method :footer_text

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      order = Order.new
      order.order_status_id = 1
      order
    end
  end

  def footer_text
    Setting.footer_text.gsub(/[\r\n]+/, "<br><br>")
  end

end
