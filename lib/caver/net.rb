# frozen_string_literal: true

module Caver
  # Klaytn's Platform API namespaced to +net+
  #
  # see https://docs.klaytn.com/api/platform/klay
  module Net
    extend self

    def networkID
      Caver.client.request("net_networkID")
    end
  end
end
