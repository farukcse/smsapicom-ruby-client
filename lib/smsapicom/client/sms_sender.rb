require 'faraday'
require 'smsapicom/client/errors'
module Smsapicom
  module Client
    class SmsSender
      attr_accessor :params

      def self.call(to: nil, message: nil, date: nil)
        new(to: to, message: message, date: date).call
      end

      def initialize(to: nil, message: nil, date: nil)
        @params = { to: to, message: message, date: date }
      end

      def call
        set_params
        connection.post { |req| req.body = params }
      end

      def set_params
        params[:url] = ENV['URL']
        params[:username] = ENV['USERNAME']
        params[:password] = ENV['PASSWORD']
        params[:from] = ENV['FROM']
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
