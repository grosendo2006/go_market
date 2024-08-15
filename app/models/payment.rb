# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  state      :integer          default(0), not null
#  amount     :float
#  url        :string
#  order_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Payment < ApplicationRecord
  validates :url, presence: true
end
