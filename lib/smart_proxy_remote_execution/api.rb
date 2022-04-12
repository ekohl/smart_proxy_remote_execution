require_relative 'dependency_injection'

module Proxy
  module RemoteExecution
    class Api < ::Sinatra::Base
      extend Proxy::RemoteExecution::DependencyInjection
      inject_attr :transport, :transport

      helpers ::Proxy::Helpers

      # Require authentication
      authorize_with_trusted_hosts
      authorize_with_ssl_client

      get '/pubkey' do
        transport.pubkey
      rescue NotImplementedError
        # TODO: not correct code
        404
      end
    end
  end
end
