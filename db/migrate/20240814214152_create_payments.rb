# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.integer :state, null: false, default: 0
      t.float :amount
      t.string :url
      t.uuid :conekta_payment_id
      t.references :order

      t.timestamps
    end
  end
end
