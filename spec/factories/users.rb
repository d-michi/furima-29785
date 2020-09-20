FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '山田' }
    first_name_kana       { 'カタカナ' }
    last_name             { '太郎' }
    last_name_kana        { 'カタカナ' }
    birth_date            { '2020-01-01' }
  end
end
