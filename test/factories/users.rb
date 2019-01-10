FactoryBot.define do
  factory :user do
    email { 'niaz.lutfullin@mail.ru' }
    password { 'test1234' }
    role { 1 }
  end
end
