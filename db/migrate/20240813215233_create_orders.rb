# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :state, null: false, default: 0
      t.float :amount
      t.string :customer_name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
