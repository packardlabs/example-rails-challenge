FactoryGirl.define do
  factory :credit_card_charge do
    amount_cents { Faker::Number.number(4) }

    trait :successful do
      paid true
    end

    trait :disputed do
      paid true
      refunded true
    end

    trait :failed do
      paid false
    end
  end
end
