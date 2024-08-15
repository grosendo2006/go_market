# frozen_string_literal: true

module Conekta
  class ProcessWebhookPaymentJob < ApplicationJob
    queue_as :default

    def perform(json_event)
      @json_event = json_event

      puts "LLego el evento #{json_event['type']}"
    end

    private

    attr_reader :json_event

    def event
      @event ||= JSON.parse(json_event)
    end
  end
end
