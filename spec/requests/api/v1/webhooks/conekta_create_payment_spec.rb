# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Webhooks::ConektaController do
  subject do
    post(
      api_v1_webhooks_conekta_path,
      params: json_event,
      as: :json
    )
    response
  end

  let(:json_event) { load_json('/events/charge_created_event') }

  describe '#create' do
    context 'when the event received is processed correctly' do
      it 'enqueues the job' do
        expect { subject }.to have_enqueued_job(Conekta::ProcessWebhookPaymentJob)
          .on_queue('default')
      end
    end

    context 'when the event received raise a JSON::ParserError' do
      let(:json_event) { nil }

      it 'does not enqueues the job' do
        is_expected.to have_http_status(:bad_request)

        expect { subject }.to_not have_enqueued_job(Conekta::ProcessWebhookPaymentJob)
          .on_queue('default')
      end
    end
  end
end
