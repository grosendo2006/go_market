# frozen_string_literal: true

# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  price      :float
#  quantity   :integer
#  order_id   :bigint
#  product_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :line_item do
    price { Faker::Number.between(from: 1, to: 999_999) }
    quantity { Faker::Number.between(from: 1, to: 10) }
  end
end
