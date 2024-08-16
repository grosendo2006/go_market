# == Schema Information
#
# Table name: orders
#
#  id            :bigint           not null, primary key
#  customer_name :string
#  phone         :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :order do
    customer_name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    email { Faker::Internet.email }

    trait :with_1_line_item_with_1_product do
      after(:create) do |order|
        product = create(:product)
        create(:line_item, order: order, product: product, price: product.price, quantity: 1)
      end
    end
  end
end
