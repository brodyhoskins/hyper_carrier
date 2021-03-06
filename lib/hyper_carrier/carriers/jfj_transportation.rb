# frozen_string_literal: true

module HyperCarrier
  class JFJTransportation < Liftoff
    REACTIVE_FREIGHT_CARRIER = true

    cattr_reader :name, :scac
    @@name = 'JFJ Transportation'
    @@scac = nil
  end
end
