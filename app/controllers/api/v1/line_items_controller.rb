# frozen_string_literal: true

module Api
  module V1
    class LineItemsController < ApplicationController

      # POST /api/v1/line_items
      def create
        @line_item = LineItem.new(line_item_params)
        @line_item.price = Product.find(line_item_params[:product_id]).price

        if @line_item.save
          render json: @line_item, status: :created
        else
          render json: @line_item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/line_items/1
      def destroy
        @line_item = LineItem.find(params[:id])
        @line_item.destroy
      end

      private

      # Only allow a list of trusted parameters through.
      def line_item_params
        params.permit(:order_id, :product_id, :quantity)
      end
    end
  end
end
