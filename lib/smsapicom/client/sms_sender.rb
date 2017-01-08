require 'faraday'
require 'smsapicom/client/errors'
require 'active_support/configurable'
module Smsapicom
  module Client
    class SmsSender
      include ActiveSupport::Configurable
      attr_accessor :params

      def self.call(to: nil, message: nil, date: nil)
        new(to: to, message: message, date: date).call
      end

      def initialize(to: nil, message: nil, date: nil)
        @params = { to: to, message: message, date: date }
      end

      def call
        set_params
        response = connection.post { |req| req.body = params }
        raise Smsapicom::Client::Errors::SmsSendFailed, response.body if response.body['ERROR']
      end

      def set_params
        params[:url] = config.url
        params[:username] = config.username
        params[:password] = config.password
        params[:from] = config.from
        unless params[:date].nil?
          params[:date] = params[:date].to_time.to_i.to_s
        end
      end

      def connection
        Faraday.new(url: params[:url]) do |faraday|
          faraday.request :url_encoded
          faraday.adapter Faraday.default_adapter
        end
      end
    end
  end
end
