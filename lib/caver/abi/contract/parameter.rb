# frozen_string_literal: true

require "active_model"

module Caver::ABI
  class Contract
    class Parameter
      include ActiveModel::Model

      attr_accessor :name, :type
    end
  end
end
