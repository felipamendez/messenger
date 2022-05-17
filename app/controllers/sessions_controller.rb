class SessionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def create
        user = User.find_by!(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            render json: {errors: "Username or password not valid."}
        end
    end

    private 

    def record_not_found
        render json: {errors:  message.errors.full_messages}, status: :unprocessable_entity
    end
end