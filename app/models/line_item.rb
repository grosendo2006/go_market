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
class LineItem < ApplicationRecord
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  belongs_to :product
  belongs_to :order
end
