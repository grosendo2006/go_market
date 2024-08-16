# == Schema Information
#
# Table name: payments
#
#  id                 :bigint           not null, primary key
#  state              :integer          default("created"), not null
#  url                :string
#  conekta_payment_id :uuid
#  order_id           :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :payment do
    url { Faker::Internet.url }
    conekta_payment_id { Faker::Internet.uuid }
  end
end
