module Smsapicom
  module Client
    module Errors
      class BaseError < StandardError; end

      class SmsSendFailed < BaseError
        def initialize(error_message)
          @error_message = error_message
        end

        def to_s
          "#{@error_message}, Failed to send sms"
        end
      end
    end
  end
end
