# frozen_string_literal: true

require "json"
require "net/http"

module Caver
  module RPC
    class Client
      JSON_RPC_VERSION = "2.0"
      DEFAULT_HOST = "http://localhost:8545"
      CONTENT_TYPE = "application/json"

      attr_reader :uri

      def initialize(host = DEFAULT_HOST)
        @uri = URI(host)
      end

      def request(method, params = nil)
        body = {
          jsonrpc: JSON_RPC_VERSION,
          method: method,
          params: params,
          id: SecureRandom.uuid
        }.compact.to_json

        response = client.post(uri, body, "Content-Type" => CONTENT_TYPE)

        Response.new.from_json(response.body)
      end

      private
        def client
          @client ||= ::Net::HTTP.new(uri.host, uri.port).tap do |connection|
            # Configure connection
            connection.use_ssl = true if uri.scheme == "https"
          end
        end
    end
  end
end
