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
class Payment < ApplicationRecord
  validates :url, presence: true
  validates :state, presence: true
  belongs_to :order

  enum state: Conekta::PaymentStateEnum::STATES
end
