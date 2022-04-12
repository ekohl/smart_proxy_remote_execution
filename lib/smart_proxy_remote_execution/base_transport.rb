module Proxy
  module RemoteExecution
    class BaseTransport
      # @return [String] the public key that clients need to trust
      def pubkey
        raise NotImplementedError
      end
    end
  end
end
