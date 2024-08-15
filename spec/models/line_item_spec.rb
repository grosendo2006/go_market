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
require 'rails_helper'

describe LineItem do
  describe 'validations' do
    subject { build(:line_item) }

    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than(0) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
  end
end
