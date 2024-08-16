# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_order, only: %i[show update destroy]

      # GET /api/v1/orders
      def index
        @orders = Order.all

        render json: @orders
      end

      # GET /api/v1/orders/1
      def show
        render json: @order, include: :line_items
      end

      # POST /api/v1/orders
      def create
        @order = Order.new(order_params)

        if @order.save
          render json: @order, status: :created
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/orders/1
      def update
        if @order.update(order_params)
          render json: @order
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/orders/1
      def destroy
        @order.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def order_params
        params.permit(:customer_name, :email, :phone)
      end
    end
  end
end
