# frozen_string_literal: true

require "test_helper"

class ABIFunctionTest < Caver::TestCase
  test "encoding baz(uint32, bool)" do
    expected = "cdcd77c000000000000000000000000000000000000000000000000000000000000000450000000000000000000000000000000000000000000000000000000000000001"
    inputs = [
     {
        name: "x",
        type: "uint32"
      },
      {
        name: "y",
        type: "bool"
      }
    ]
    baz = Caver::ABI::Contract::Function.new(name: "baz", inputs: inputs, outputs: [])

    assert_equal expected, baz.call(69, true)[:data]
  end

  test "encoding bar(bytes3[2])" do
    expected = "fce353f661626300000000000000000000000000000000000000000000000000000000006465660000000000000000000000000000000000000000000000000000000000"
    inputs = [
      {
        name: "baz",
        type: "bytes3[2]"
      }
    ]

    bar = Caver::ABI::Contract::Function.new(name: "bar", inputs: inputs, outputs: [])
    assert_equal expected, bar.call(["abc", "def"])[:data]
  end
end
