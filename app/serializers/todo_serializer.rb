class TodoSerializer
  include JSONAPI::Serializer

  attributes :user_id, :title, :completed
end
