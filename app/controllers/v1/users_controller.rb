class V1::UsersController < ApplicationController
  def index
    users = User.all

    users_count = users.size

    options = {
      fields: { todo: %i(name user_name email phone website) },
    }

    users = users.map do |user|
      jsonapi_deserialize(UserSerializer.new(user, options).serializable_hash)
    end

    render json: { users: users, users_count: users_count }
  end
end