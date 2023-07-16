class UserSerializer
  include JSONAPI::Serializer

  has_many :todos

  attributes :name, :email
end
