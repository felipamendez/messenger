class UsersController < ApplicationController

    def index
        other_users = User.all.select{|user| user.id != session[:user_id]}
        render json: other_users
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user, status: 200
        else
            render json: {error: "Not authorized"}, status: :unauthorized
       end
    end

   


end
