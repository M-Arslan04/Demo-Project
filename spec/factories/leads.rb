FactoryBot.define do

  factory :lead do
    title { "Some Random Title" }
    client_name { "John" }
    client_address { "SOme random address for testing purposes" }
    client_email { "randomemail@example.com" }
    client_contact { "0123123123" }
    platform_used { "linkedIn" }
    test_type { "Example" }
    association :user, factory: :user
  end
end
