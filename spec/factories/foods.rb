FactoryGirl.define do
  factory :food do
    name { Faker::Name.name }
		expiration_date { Faker::Date.backward(14) }
		brand { Faker::Company.buzzword }
		quantity { Faker::Number.number(5) }	
		weight { Faker::Number.decimal(1, 1) }
  end

end
