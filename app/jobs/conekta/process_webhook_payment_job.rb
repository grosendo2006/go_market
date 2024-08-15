# frozen_string_literal: true

module Conekta
  class ProcessWebhookPaymentJob < ApplicationJob
    queue_as :default

    def perform(json_event)
      @json_event = json_event

      puts "LLego el evento #{event_type}"

      payment_event? ? update_payment : log_unhandled_event
    end

    private

    attr_reader :json_event

    def payment_event?
      event_type.starts_with?('charge.')
    end

    def update_payment
      PaymentStateHandlerService.call(state: state, conekta_payment_id: conekta_payment_id)
    end

    def state
      event_type.split('.').last
    end

    def event_type
      json_event['type']
    end

    def conekta_payment_id
      # esto no esta en la documentacion de charge.created https://developers.conekta.com/docs/charge#cargo-creado---chargecreated
      json_event['data']['object']['channel']['checkout_request_id']
    end

    def log_unhandled_event
      puts "recived unhandled event: #{event_type}"
    end
  end
end
