FactoryBot.define do
  factory :event do
    title               { 'タイトル' }
    content             { 'コンテント' }
    worktime             { '1' }
    start_time           { '2021-04-13 15:28:00' }
    association :user
  end
end
