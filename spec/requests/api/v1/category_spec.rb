require 'rails_helper'

RSpec.describe Category, type: :request do
	subject(:category) { create(:category) }

	context "Sucess" do
		it "returns list of categories" do
			categories = create_list(:category, 5)

			get "/v1/categories/", {}, {}

			expect(response.status).to eq(200)
			expect(json["categories"].length).to eq(5)
		end

		it "returns category if created" do
			params = category.name

			post "/v1/categories/", params, {}

			expect(response.status).to eq(201)
			expect(json["message"]).to be_present

		end
	end

end