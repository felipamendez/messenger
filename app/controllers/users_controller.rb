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

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: 422
    end

   private

   def user_params
        params.permit(:username, :password)
   end


end
