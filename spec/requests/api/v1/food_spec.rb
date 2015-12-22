require 'rails_helper'

RSpec.describe Food, type: :request do
	subject(:food) { create(:food) }

	it "return list of foods" do 
		foods = create_list(:food, 10)

		get "/v1/foods/", {}, {}

		expect(response.status).to eq(200)
		expect(json["foods"].length).to eq(10)
	end

	it "return when a food has been created" do
		category = create(:category)
		food1 = create(:food, category_id: category.id)
		params = food1.attributes.except('id', 'created_at', 'updated_at')

		post "/v1/foods/", params, {}

		expect(response.status).to eq(201)
		expect(json["food"]["id"]).to be_present
		expect(json["food"]["name"]).to be_present
		expect(json["food"]["expiration_date"]).to be_present
	end

	it "return when a food has been destroyed" do
		delete "/v1/foods/#{food.id}"

		expect(response.status).to eq(204)
	end

end