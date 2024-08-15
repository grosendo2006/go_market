# frozen_string_literal: true

class PaymentGeneratorService
  attr_reader :order_id

  def self.call(order_id:)
    new(order_id).generate
  end

  def initialize(order_id)
    @order_id = order_id
  end

  def generate
    payment_link_params = Conekta::PaymentLinkGeneratorService.call(order_id: order_id)
    response = client.create_payment_link(payment_link_params)
    generate_payment(response)
  end

  private

  def client
    @client ||= Conekta::ApiClientService.new
  end

  def generate_payment(response)
    Payment.new(
      {
        conekta_payment_id: response['id'],
        url: response['url'],
        order_id: order_id
      }
    )
  end
end
