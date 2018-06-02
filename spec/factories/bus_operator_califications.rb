FactoryBot.define do
  factory :bus_operator_calification do
    bus_operator_id { BusOperator.last.try(:id) || FactoryBot.create(:bus_operator).id }
    rating { (1..5).to_a.sample }
    comment { FFaker::Lorem.paragraph }

    trait :invalid do
      bus_operator nil
      rating nil
    end
  end
end
