# frozen_string_literal: true

class RemoveAmountFromPayments < ActiveRecord::Migration[7.1]
  def change
    remove_column :payments, :amount, :float
  end
end
