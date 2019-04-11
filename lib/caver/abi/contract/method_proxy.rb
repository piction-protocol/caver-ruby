# frozen_string_literal: true

module Caver::ABI
  class Contract
    class MethodProxy
      def initialize(functions)
        @functions = functions
        @functions.each do |function|
          class_eval do
            define_method function.name do |*args|
              function.call(*args)
            end
          end
        end
      end

      def [](name)
        @functions.find { |f| f.name == name }
      end
    end
  end
end
