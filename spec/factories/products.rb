# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Number.between(from: 1, to: 999_999) }
  end
end
