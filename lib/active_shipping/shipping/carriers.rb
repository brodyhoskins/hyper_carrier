require 'active_shipping/shipping/carriers/bogus_carrier'
require 'active_shipping/shipping/carriers/usps'

module ActiveMerchant
  module Shipping
    module Carriers
      class <<self
        def all
          [BogusCarrier,USPS]
        end
      end
    end
  end
end