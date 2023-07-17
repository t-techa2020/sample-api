FactoryBot.define do
  factory :todo do
    title { 'todo title1' }
    user_id { '1' }
    completed { false }
  end
end
