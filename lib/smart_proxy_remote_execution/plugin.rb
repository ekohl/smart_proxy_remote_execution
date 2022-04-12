require_relative 'version'

module Proxy
  module RemoteExecution
    class Plugin < ::Proxy::Plugin
      plugin :remote_execution, ::Proxy::RemoteExecution::VERSION
      rackup_path File.expand_path('http_config.ru', __dir__)

      uses_provider
      default_settings mode: 'ssh'

      validate :mode, enum: ['ssh', 'ssh-async']

      load_classes do
        # TODO: based on mode?
        require 'smart_proxy_remote_execution/ssh/provider'
      end

      load_programmable_settings do |settings|
        # TODO: based on mode
        settings[:use_provider] = [:remote_execution_ssh]
        settings
      end
    end
  end
end
