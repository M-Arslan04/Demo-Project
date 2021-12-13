FactoryBot.define do

  factory :user do
    name { "Joe" }
    email { Faker::Internet.email(name: 'Joe') }
    password { "blahblah" }
  end
  trait 'business_developer' do
    after(:create) {|user|
      user.roles = []
      user.add_role(:business_developer)}
  end
end
