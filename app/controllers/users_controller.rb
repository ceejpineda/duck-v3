class UsersController < ApplicationController
    def index
    end

    def show
        @rooms = Room.all
        @user = User.find(params[:id])
        @users = User.where.not(id: params[:id])
    end
    
end
