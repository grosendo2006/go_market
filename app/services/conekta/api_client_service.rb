# frozen_string_literal: true

module Conekta
  class ApiClientService
    attr_reader :client

    def initialize
      @client = Conekta::Client
    end

    def create_payment_link(payment_link_params)
      response = client.post(
        '/checkouts',
        body: payment_link_params
      )
      parse_response(response)
    end

    private

    def parse_response(response)
      raise StandardError, "Conekta error: #{response.parsed_response}" unless response.code == 200

      response.parsed_response
    end
  end
end
