class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id
end
