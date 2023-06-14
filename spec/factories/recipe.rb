FactoryBot.define do
    factory :recipe do
      name { "Tuna Salad" }
      description { "It is a dish made of Tuna fish and Salad" }
      association(:user)
    end
  end