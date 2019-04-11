# frozen_string_literal: true

module Caver
  module NumericWithEncoding
    def encode_to_abi
      self.to_s(16).rjust(64, "0")
    end
  end

  module BooleanWithEncoding
    def encode_to_abi
      (self ? "1" : "0").rjust(64, "0")
    end
  end

  module StringWithEncoding
    def encode_to_abi
      bytesize = self.bytesize.to_s(16).rjust(64, "0")
      body = self.bytes.map { |b| b.to_s(16) }.join.ljust(64, "0")

      bytesize + body
    end
  end

  module ArrayWithEncoding
    def encode_to_abi
      length = self.size.to_s(16).rjust(64, "0")
      data = self.map { |e| e.encode_to_abi }.join
      length + data
    end
  end
end

String.prepend Caver::StringWithEncoding
Numeric.prepend Caver::NumericWithEncoding
TrueClass.prepend Caver::BooleanWithEncoding
FalseClass.prepend Caver::BooleanWithEncoding
Array.prepend Caver::ArrayWithEncoding
