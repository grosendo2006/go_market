# frozen_string_literal: true

class RemoveAmountAndStateFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :amount, :float
    remove_column :orders, :state, :integer
  end
end
