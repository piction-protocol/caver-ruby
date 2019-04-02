# frozen_string_literal: true

require "active_model"

module Caver
  module RPC
    class Response
      include ActiveModel::Model
      include ActiveModel::Serializers::JSON

      attr_accessor :jsonrpc, :result, :error, :id
    end
  end
end
