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
require 'rails_helper'

describe Payment do
  subject { build(:payment) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:order) }
  end
end
