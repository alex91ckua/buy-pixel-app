class ContactUsController < ApplicationController

  def create

    if params[:name].blank? || params[:email].blank? || params[:body].blank?
      flash[:danger] = 'Fields are blank, please fill them.'
    else
      name = params[:name]
      email = params[:email]
      subject = params[:subject]
      body = params[:body]
      flash[:success] = 'Message sent!'
      ContactUsMailer.contact_us(name, email, subject, body).deliver_now
    end

      redirect_to contact_us_status_path
  end
  
end
