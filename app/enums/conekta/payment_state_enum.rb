# frozen_string_literal: true

module Conekta
  module PaymentStateEnum
    CREATED = :created
    PAID = :paid 
    UNDER_FRAUD_REVIEW = :under_fraud_review
    FRAUDULENT = :fraudulent
    REFUNDED = :refunded
    PREAUTHORIZED = :preauthorized
    DECLINED = :declined
    CANCELED = :canceled
    REVERSED = :reversed
    PENDING_CONFIRMATION = :pending_confirmation
    EXPIRED = :expired

    STATES = {
      CREATED => 0,
      PAID => 1,
      UNDER_FRAUD_REVIEW => 2,
      FRAUDULENT => 3,
      REFUNDED => 4,
      PREAUTHORIZED => 5,
      DECLINED => 6,
      CANCELED => 7,
      REVERSED => 8,
      PENDING_CONFIRMATION => 9,
      EXPIRED => 10
    }.freeze
  end
end
