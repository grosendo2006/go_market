# frozen_string_literal: true

require 'rails_helper'

describe 'Products' do
  describe 'GET index' do
    subject { get api_v1_products_path }

    it 'have http status 200' do
      expect(subject).to eq(200)
    end

    context 'when there are products' do
      let!(:products) { create_list(:product, 10) }

      it 'returns the products' do
        subject

        expect(response).to match_json_schema('api/v1/products')
      end
    end

    context 'when there aren\'t products' do
      it 'returns the user' do
        subject

        expect(response.body).to eq('[]')
      end
    end
  end
end
