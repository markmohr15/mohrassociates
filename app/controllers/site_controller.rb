class SiteController < ApplicationController

  def home
    @contact = WebContact.new
  end

  def about_us
    render
  end

  def resources
    render
  end

  def services
    render
  end

  def tax_rates
    render
  end

  def contact_us
    @contact = WebContact.new(web_contact_params)
    if validate_recaptcha && @contact.save
      ContactMailer.contact_us(@contact).deliver_now
      redirect_to root_path, notice: "Thanks for contacting us. We'll be in touch soon."
    else
      flash.now[:alert] = "There was a problem. Please try again."
      render :home
    end
  end

private

  def web_contact_params
    params.require(:web_contact).permit(:name, :email, :phone, :comment)
  end

  def validate_recaptcha
    return false if params["g-recaptcha-response"].blank?
    response = HTTParty.post("https://www.google.com/recaptcha/api/siteverify", body: {
                    secret: ENV["RECAPTCHA_SECRET_KEY"],
                    response: params["g-recaptcha-response"]})
    response["success"] == true
  end

end