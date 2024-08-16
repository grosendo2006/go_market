# frozen_string_literal: true

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
class Order < ApplicationRecord
  validates :customer_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, length: { minimum: 10, maximum: 15 }

  has_many :line_items
  has_many :products, through: :line_items
end
