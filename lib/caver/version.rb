# frozen_string_literal: true

require_relative "gem_version"

module Caver
  def self.version
    gem_version
  end
end
