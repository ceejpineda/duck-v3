class ContactMailer < ApplicationMailer
    def contact_email(name, email, message)
      @name = name
      @message = message
  
      mail(to: 'pinedacj1020@gmail.com', subject: "Duck Employee Report from #{name}")
    end
end