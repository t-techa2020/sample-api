class UserSerializer
  include JSONAPI::Serializer

  attributes :name, :user_name, :email, :phone, :website
end
