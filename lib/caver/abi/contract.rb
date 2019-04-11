# frozen_string_literal: true

require "active_support/core_ext/hash"
require "caver/abi/contract/function"
require "caver/abi/contract/method_proxy"

module Caver
  module ABI
    class Contract
      attr_reader :methods

      def initialize(abi)
        abi = abi.map(&:with_indifferent_access)

        functions = []
        abi.each do |x|
          case x[:type]
          when "constructor"
            @contructor_inputs = x["inputs"]
          when "function"
            functions << Function.new(x)
          end
        end

        @methods = MethodProxy.new(functions)
      end
    end
  end
end
