require 'rails_helper'

RSpec.describe Food, type: :request do
	subject(:food) { create(:food) }

	it "return list of foods" do 
		foods = create_list(:food, 10)

		get "/v1/foods/", {}, {}

		expect(response.status).to eq(200)
		expect(json["foods"].length).to eq(10)
	end

end