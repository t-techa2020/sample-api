require 'rails_helper'

RSpec.describe V1::UsersController, type: :request do
  include Committee::Rails::Test::Methods

  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  describe 'GET /v1/users' do
    context 'ログインしたユーザーでリクエストした時' do
      it 'スキーマ通りのレスポンスを返すこと' do
        get v1_users_path
        assert_response_schema_confirm(200)
      end
    end
  end
end