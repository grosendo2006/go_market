# == Schema Information
#
# Table name: orders
#
#  id            :bigint           not null, primary key
#  state         :integer          default(0), not null
#  amount        :float
#  customer_name :string
#  phone         :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

describe Order do
  subject { build(:order) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:customer_name) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:line_items) }
    it { is_expected.to have_many(:products).through(:line_items) }
  end
end
