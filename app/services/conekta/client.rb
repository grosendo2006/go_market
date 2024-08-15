# frozen_string_literal: true

module Conekta
  class Client
    include HTTParty

    base_uri ENV.fetch('CONEKTA_API_URL', '')
    headers 'Authorization' => "Bearer #{ENV.fetch('CONEKTA_API_KEY', '')}",
            'Content-Type' => 'application/json',
            'accept': 'application/vnd.conekta-v2.1.0+json'
  end
end
