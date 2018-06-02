FactoryBot.define do
  factory :bus_operator do
    internal_name { official_name.to_s.parameterize.underscore }
    official_name { FFaker::Lorem.words(2).join(" ")}
    recorrido_id { BusOperator.last.try(:recorrido_id).to_i + 1 }
    average_rating { 1.5 }
    slug { official_name.to_s.parameterize }
    icons {
      ""
    }
    images {
      ""
    }
    description nil

    trait :invalid do
      official_name nil
      recorrido_id nil
    end
  end
end
