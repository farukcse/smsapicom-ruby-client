module Smsapicom
  module Client
    module Errors
      class BaseError < StandardError; end

      class SmsSendFailed < BaseError
        def initialize(attributes)
          @attributes = attributes
        end

        def to_s
          "attributes: #{@attributes}, Failed to send sms"
        end
      end
    end
  end
end
