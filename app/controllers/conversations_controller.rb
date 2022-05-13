class ConversationsController < ApplicationController
    def index
        @conversations = Conversation.all
        render json: @conversations, status: 200
    end

    def create
        @conversation = Conversation.create!(conversation_params)
    end

    private

    def conversation_params
        params.permit(:content, :user_id)
    end
    
end
