FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'test0000' }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_hurigana    { 'タナカ' }
    first_name_hurigana   { 'タロウ' }
    birthday              { '1990-01-01' }
  end
end
