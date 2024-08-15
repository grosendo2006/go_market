# frozen_string_literal: true

class PaymentStateHandlerService
  attr_reader :state, :conekta_payment_id

  def self.call(state:, conekta_payment_id:)
    new(state, conekta_payment_id).update_payment_state
  end

  def initialize(state, conekta_payment_id)
    @state = state
    @conekta_payment_id = conekta_payment_id
  end

  def update_payment_state
    return unknow_state unless valid_state?

    payment.update!(state: new_state)
  end

  private

  def unknow_state
    raise StandardError, '[Conekta] Unknown event type'
  end

  def valid_state?
    Conekta::PaymentStateEnum::STATES.include?(state.to_sym)
  end

  def new_state
    Conekta::PaymentStateEnum::STATES[state.to_sym]
  end

  def payment
    @payment ||= Payment.find_by(conekta_payment_id: conekta_payment_id)
  end
end
