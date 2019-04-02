# frozen_string_literal: true

module Caver
  # Klaytn's Platform API namespaced to +klay+
  #
  # see https://docs.klaytn.com/api/platform/klay
  module Klay
    extend self

    def protocolVersion
      Caver.client.request("klay_protocolVersion").result.to_i(16)
    end

    def syncing?
      Caver.client.request("klay_syncing").result
    end

    def mining?
      Caver.client.request("klay_mining").result
    end

    def gasPrice
      Caver.client.request("klay_gasPrice").result.to_i(16)
    end

    def accounts
      Caver.client.request("klay_accounts").result
    end

    def isParallelDBWrite?
      Caver.client.request("klay_isParalleDBWrite").result
    end

    def getBalance(address)
      Caver.client.request("klay_getBalance", [address, "latest"]).result.to_i(16)
    end
  end
end
