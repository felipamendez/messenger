class MessagesController < ApplicationController

    def show
        conversation = Conversation.find_by(user_id: session[:user_id])
        if conversation.valid?
            messages = Message.all.select{|message| message.conversation_id == conversation.id }
            render json: messages, status: 200
        else
            render json: {error: "No conversation to show"}
        end
    end

    def create
        message = Message.new()
        current_user = User.find_by(id: session[:user_id])
        conversation = Conversation.find_by(user_id: current_user.id)
        message.conversation_id = conversation.id
        message.content = params[:content]

        if message.valid?
            message.save
            render json: message, status: 201
        else
            render json: {errors: message.errors.full_messages}, status: 422
        end
    end

end
