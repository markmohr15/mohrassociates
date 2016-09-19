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

  def news
    render
  end

  def services
    render
  end

  def contact_us
    web_contact = WebContact.new(web_contact_params)
    if web_contact.save
      ContactMailer.contact_us(web_contact).deliver_now
      redirect_to root_path, notice: "Thanks for contacting us. We'll be in touch soon."
    else
      render :home
    end
  end

private

  def web_contact_params
    params.require(:web_contact).permit(:name, :email, :phone, :comment)
  end

end
