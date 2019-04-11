# frozen_string_literal: true

require "test_helper"

class ABITest < Caver::TestCase
  with_abi_fixture("greeter") do |abi, name|
    test "can be initialized" do
      methods = Caver::ABI::Contract.new(abi).methods
      assert methods.respond_to?(:greet)
      assert methods.respond_to?(:kill)
    end
  end
end
