# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.float :price
      t.integer :quantity
      t.references :order
      t.references :product

      t.timestamps
    end
  end
end
