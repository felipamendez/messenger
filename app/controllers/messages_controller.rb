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
    
end
