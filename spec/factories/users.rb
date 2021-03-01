FactoryBot.define do
  factory :user do
    first_name            {'テスト'}
    last_name             {'太郎'}
    nick_name             {'test'}
    email                 {'test@example'}
    password              {'000000km'}
    password_confirmation {password}
  end
end