# frozen_string_literal: true

module Api
  module V1
    class PaymentsController < ApplicationController
      before_action :set_payment, only: :show

      # POST /api/v1/payments
      def create
        @payment = PaymentGeneratorService.call(order_id: order_id)

        if @payment.save
          render json: @payment, status: :created
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      # GET /api/v1/payments/1
      def show
        render json: @payment
      end

      private

      # Only allow a list of trusted parameters through.
      def payment_params
        params.permit(:order_id)
      end

      def order_id
        payment_params[:order_id]
      end

      def set_payment
        @payment = Payment.find_by(id: params[:id])
      end
    end
  end
end
