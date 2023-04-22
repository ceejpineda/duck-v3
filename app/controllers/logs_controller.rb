class LogsController < ApplicationController

    def clock_in
        @log = Log.new
        @log.user_id = session[:user_id]
        @log.action = "clockIn"
        @log.save
    end

    def clock_out
        @log = Log.new
        @log.user_id = session[:user_id]
        @log.action = "clockOut"
        @log.save
    end

    def inactive
        @log = Log.new
        @log.user_id = session[:user_id]
        @log.action = "inactive"
        @log.save
    end

    def create
        name = User.find(session[:user_id])
        email = "pinedacj1020@gmail.com"
        message = params[:message]
        puts """EMAIL SENT
        PLEASE CHECK EMAIL
        TEST PUTS ONLY."""
        ContactMailer.contact_email(name, email, message, ).deliver_now
    
        redirect_to "/users/#{session[:user_id]}"
    end
end
