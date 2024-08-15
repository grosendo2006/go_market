# frozen_string_literal: true

module Conekta
  class PaymentLinkGeneratorService
    attr_reader :order_id

    def self.call(order_id:)
      new(order_id).generate.to_json
    end

    def initialize(order_id)
      @order_id = order_id
    end

    def generate
      {
        order_template: order_template,
        recurrent: false,
        allowed_payment_methods: ['cash', 'card', 'bank_transfer'],
        expires_at: 1724160987, # calculate
        monthly_installments_enabled: true,
        monthly_installments_options: [3,6,12],
        name: 'Payment Link Name', # generate
        needs_shipping_contact: false,
        on_demand_enabled: true,
        payments_limit_count: 5,
        type: 'PaymentLink'
      }
    end

    private

    def order
      @order ||= Order.find_by(id: order_id)
    end

    def order_template
      {
        customer_info: customer_info,
        metadata: { key: 'value' },
        currency: 'MXN',
        line_items: line_items
      }
    end

    def line_items
      order.line_items.map do |line_item|
        {
          name: line_item.product.name,
          quantity: line_item.quantity,
          unit_price: line_item.price.to_i
        }
      end
    end

    def customer_info
      {
        name: order.customer_name,
        email: order.email,
        phone: order.phone,
        corporate: true,
        object: 'customer_info'
      }
    end
  end
end
