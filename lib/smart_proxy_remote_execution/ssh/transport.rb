module Proxy
  module RemoteExecution
    module Ssh
      class Transport < ::Proxy::RemoteExecution::BaseTransport
        def initialize(identity_key_file, identity_pubkey_file, user, kerberos_auth)
          @identity_key_file = identity_key_file
          @identity_pubkey_file = identity_pubkey_file
          @user = user
          @kerberos_auth = kerberos_auth
        end

        def pubkey
          File.read(@identity_pubkey_file)
        end
      end
    end
  end
end
