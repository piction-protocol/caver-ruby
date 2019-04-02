# frozen_string_literal: true

require "active_support"
require "caver/version"

# Klaytn client
module Caver
  extend ActiveSupport::Autoload

  autoload :Klay
  autoload :Net

  module RPC
    extend ActiveSupport::Autoload

    autoload :Client
    autoload :Response
  end

  extend self

  attr_reader :client

  # Connect to the klaytn node using host URL
  def connect(host = Caver::RPC::Client::DEFAULT_HOST)
    @client = Caver::RPC::Client.new(host)
  end
end
