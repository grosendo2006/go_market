# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PaymentsController do
  subject do
    post(
      api_v1_payments_path,
      params: { order_id: order_id },
      as: :json
    )
    response
  end

  let(:url) { "#{ENV.fetch('CONEKTA_API_URL', nil)}/checkouts" }
  let(:order) { create(:order, :with_1_line_item_with_1_product) }
  let(:order_id) { order.id }
  let(:product) { order.products.first }
  let(:request_body) do
    {
      order_template: {
        customer_info: {
          name: order.customer_name,
          email: order.email,
          phone: order.phone,
          corporate: true,
          object: 'customer_info'
        },
        metadata: { key: 'value' },
        currency: 'MXN',
        line_items: [
          {
            name: product.name,
            quantity: order.products.count,
            unit_price: product.price.to_i
          }
        ]
      },
      recurrent: false,
      allowed_payment_methods: ['cash', 'card', 'bank_transfer'],
      expires_at: 1724160987,
      monthly_installments_enabled: true,
      monthly_installments_options: [3, 6, 12],
      name: 'Payment Link Name',
      needs_shipping_contact: false,
      on_demand_enabled: true,
      payments_limit_count: 5,
      type: 'PaymentLink'
    }
  end
  let(:default_headers) do 
    {
      'Content-Type': 'application/json',
      'Authorization': "Bearer #{ENV.fetch('CONEKTA_API_KEY', '')}",
      'accept': 'application/vnd.conekta-v2.1.0+json'
    }
  end
  let(:successful_response_body) do
    {
      id: '08fca00d-3bf4-494f-be81-2721a727de11',
      name: 'Payment Link Name 1594138857',
      livemode: false,
      emails_sent: 0,
      success_url: ',
      failure_url: ',
      paid_payments_count: 0,
      sms_sent: 0,
      status: 'Issued',
      type: 'PaymentLink',
      recurrent: false,
      starts_at: 1723701600,
      expires_at: 1754651540,
      allowed_payment_methods: [
        'cash',
        'card',
        'bank_transfer'
      ],
      exclude_card_networks: [],
      needs_shipping_contact: false,
      monthly_installments_options: [
        3,
        6,
        12
      ],
      monthly_installments_enabled: true,
      force_3ds_flow: false,
      metadata: {
        key: 'value'
      },
      can_not_expire: false,
      object: 'checkout',
      is_redirect_on_failure: false,
      slug: '08fca00d3bf4494fbe812721a727de11',
      url: 'https://pay.conekta.com/link/08fca00d3bf4494fbe812721a727de11'
    }
  end

  describe '#create' do
    context 'erroneous requests' do
      context 'when the order is invalid' do
        let(:order_id) { nil }

        it 'returns an error' do
          is_expected.to have_http_status(:internal_server_error)
        end
      end
    end

    context 'successful requests' do
      before do
        WebMock.stub_request(:post, url).with(
          body: request_body,
          headers: default_headers
        ).to_return(
          status: 200,
          body: successful_response_body.to_json,
          headers: default_headers
        )
      end

      it 'returns the payment with the url' do
        subject
        expect(response).to match_json_schema('api/v1/payment')
      end
    end
  end
end
