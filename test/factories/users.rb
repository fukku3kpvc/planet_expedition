FactoryBot.define do
  factory :user do
    email { 'niaz.lutfullin@mail.ru' }
    password { 'test1234' }
    role { User.roles[:commandor] }
  end
end
