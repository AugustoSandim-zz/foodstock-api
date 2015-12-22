class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :expiration_date, :brand, :quantity, :weight, :category
end
