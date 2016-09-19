class ContactMailer < ApplicationMailer
  layout 'mailer'

  def contact_us contact
    @name = contact.name
    @email = contact.email
    @phone = contact.phone
    @comment = contact.comment
    mail(to: 'tmohr@mohrassociates.net', subject: "Web Contact Form")
  end
end
