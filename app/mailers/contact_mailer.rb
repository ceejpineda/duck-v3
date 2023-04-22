class ContactMailer < ApplicationMailer
    def contact_email(user, email, message)
      @name = user.first_name + " " + user.last_name
      @logs = user.logs.where("DATE(created_at) = ?", Date.today)
      @message = message
  
      mail(to: 'pinedacj1020@gmail.com', subject: "Duck Employee Report from #{@name}")
    end
end