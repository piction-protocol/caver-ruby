# frozen_string_literal: true

require "active_model"
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
        raise ArgumentError, "wrong number of arguments for ##{name} (given #{args.length} , expected #{inputs.length})" if inputs.length != args.length

        payloads = []
        payloads << signature
        inputs.zip(args).each do |input, arg|
          payloads << input.payload(arg)
        end

        {
          data: payloads.join
        }
      end

      private

        def input_types
          inputs.collect { |x| x.type }
        end
    end
  end
end
