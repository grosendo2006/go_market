# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id            :bigint           not null, primary key
#  state         :integer          default(0), not null
#  amount        :float
#  customer_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Order < ApplicationRecord
  has_many :line_items
  has_many :products, through: :line_items
end
