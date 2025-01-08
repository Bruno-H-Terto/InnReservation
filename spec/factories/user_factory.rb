FactoryBot.define do
  factory :user do
    name { 'Teste' }
    password { '123456' }
    email { generate :email }
  end
end
