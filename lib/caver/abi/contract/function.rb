# frozen_string_literal: true

require "active_model"
require "caver/encoder"
require "caver/conversions"
require "caver/abi/contract/parameter"

module Caver::ABI
  class Contract
    class Function
      include ActiveModel::Model

      attr_accessor :name, :constant, :inputs, :outputs, :payable, :type, :stateMutability

      def initialize(attributes = {})
        super
        @inputs = attributes[:inputs].collect do |input|
          Parameter.new input
        end
        @outputs = attributes[:outputs].collect do |output|
          Parameter.new output
        end
      end

      def signature
        function_name = "#{name}(#{input_types.join(',')})"
        Digest::SHA3.hexdigest(function_name, 256)[0..7]
      end

      def call(*args)
        arg_types = inputs.collect(&:type)

        raise ArgumentError,
          "wrong number of arguments for ##{name} (given #{args.length} , expected #{arg_types.length})" if arg_types.length != args.length

        payload = []
        payload << signature
        arg_types.zip(args).each do |arg|
          payload << Caver::Encoder.new.encode(arg[0], arg[1])
        end

        {
          to: "address",
          from: "from",
          data: payload.join
        }
      end

      private

        def input_types
          inputs.collect { |x| x.type }
        end
    end
  end
end
