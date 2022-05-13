class ConversationsController < ApplicationController
    def index
        @conversations = Conversation.all
        render json: @conversations, status: 200
    end

    def create
        current_user = User.findy_by(id: session[:user_id])
        @conversation = Conversation.create!(conversation_params)
    end

    private

    def conversation_params
        params.permit(:content, :user_id)
    end

end
