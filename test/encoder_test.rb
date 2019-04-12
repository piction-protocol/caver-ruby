# frozen_string_literal: true

require "test_helper"

class TestEncoder < Caver::TestCase
  setup do
    @encoder = Caver::ABI::Encoder
  end

  test "encode uint" do
    assert_equal "0000000000000000000000000000000000000000000000000000000000000014", @encoder.encode("uint", 20)
    assert_equal "0000000000000000000000000000000000000000000000000000000000000005", @encoder.encode("uint32", 5)
    assert_equal "0000000000000000000000000000000000000000000000000000000000000005", @encoder.encode("uint4", 5)
    assert_equal "0000000000000000000000000000000000000000000000000000000000000005", @encoder.encode("uint256", 5)
  end

  test "encode int" do
    assert_equal "0000000000000000000000000000000000000000000000000000000000000014", @encoder.encode("int", 20)
    assert_equal "0000000000000000000000000000000000000000000000000000000000000005", @encoder.encode("int32", 5)
    assert_equal "0000000000000000000000000000000000000000000000000000000000000005", @encoder.encode("int8", 5)
    assert_equal "0000000000000000000000000000000000000000000000000000000000000005", @encoder.encode("int256", 5)

    assert_equal "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec", @encoder.encode("int256", -20)
    assert_equal "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff", @encoder.encode("int32", -1)
  end

  test "encode bool" do
    assert_equal "0000000000000000000000000000000000000000000000000000000000000001", @encoder.encode("bool", true)
    assert_equal "0000000000000000000000000000000000000000000000000000000000000000", @encoder.encode("bool", false)
  end

  test "address with wrong length raise ArgumentError" do
    assert_raises(ArgumentError) do
      @encoder.encode("address", "000000000000000000000000000000000000000")
      @encoder.encode("address", "0x000000000000000000000000000000000000000")
    end
  end

  test "address" do
    assert_equal "0000000000000000000000000000000000000000000000000000000000000000", @encoder.encode("address", "0x0000000000000000000000000000000000000000")
    assert_equal "0000000000000000000000000000000000000000000000000000000000000002", @encoder.encode("address", "0x0000000000000000000000000000000000000002")
  end

  test "bytes32" do
    assert_equal "6461766500000000000000000000000000000000000000000000000000000000", @encoder.encode("bytes32", "dave")
  end


end
