module Proxy
  module RemoteExecution
    module DependencyInjection
      include Proxy::DependencyInjection::Accessors
      def container_instance
        @container_instance ||= ::Proxy::Plugins.instance.find { |p| p[:name] == :remote_execution }[:di_container]
      end
    end
  end
end
