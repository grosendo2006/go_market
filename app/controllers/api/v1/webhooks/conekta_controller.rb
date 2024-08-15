# frozen_string_literal: true

module Api
  module V1
    module Webhooks
      class ConektaController < ApplicationController
        def create
          Conekta::ProcessWebhookPaymentJob.perform_later(json_event)

          render json: {}, status: :ok
        rescue StandardError
          render json: {}, status: :bad_request
        end

        private

        def json_event
          @json_event ||= JSON.parse(request.body.read)
        end
      end
    end
  end
end
