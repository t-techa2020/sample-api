require 'rails_helper'

RSpec.describe V1::TodosController, type: :request do
  include Committee::Rails::Test::Methods

  let(:user) { create(:user) }
  let!(:todo) { create(:todo, user_id: user.id) }

  describe 'GET /v1/todos' do
    context 'ログインしたユーザーでリクエストした時' do

      it 'スキーマ通りのレスポンスを返すこと' do
        get v1_todos_path
        assert_response_schema_confirm(200)
      end
    end
  end
end