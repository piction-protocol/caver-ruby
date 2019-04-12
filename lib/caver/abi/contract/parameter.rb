# frozen_string_literal: true

require "active_model"

module Caver::ABI
  class Contract
    class Parameter
      include ActiveModel::Model
      include Caver::ABI::Encoder

      attr_accessor :name, :type

      def payload(value)
        encode(type, value)
      end
    end
  end
end
