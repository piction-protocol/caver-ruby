# frozen_string_literal: true

require "caver/version"
require "active_support"

# Klaytn client
module Caver
  autoload :ABI, "caver/abi"
  autoload :Klay, "caver/klay"
  autoload :Net, "caver/net"

  module RPC
    autoload :Client, "caver/rpc/client"
    autoload :Response, "caver/rpc/response"
  end

  extend self

  attr_reader :client

  # Connect to the klaytn node using host URL
  def connect(host = Caver::RPC::Client::DEFAULT_HOST)
    @client = Caver::RPC::Client.new(host)
  end
end
