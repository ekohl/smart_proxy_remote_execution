module Proxy
  module RemoteExecution
    module Ssh
      class Provider < ::Proxy::Provider
        plugin :remote_execution_ssh, ::Proxy::RemoteExecution::VERSION

        requires :remote_execution, ::Proxy::RemoteExecution::VERSION

        default_settings identity_key_file: '~/.ssh/id_rsa_foreman_proxy', user: 'root', kerberos_auth: false

        validate_readable :identity_key_file, :identity_pubkey_file

        load_classes do
          require 'smart_proxy_remote_execution/base_transport'
          require 'smart_proxy_remote_execution/ssh/transport'
        end

        load_programmable_settings do |settings|
          settings[:identity_key_file] = File.expand_path(settings[:identity_key_file])

          if settings[:identity_pubkey_file]
            settings[:identity_pubkey_file] = File.expand_path(settings[:identity_key_file])
          else
            settings[:identity_pubkey_file] ||= "#{settings[:identity_key_file]}.pub"
          end
        end

        load_dependency_injection_wirings do |container_instance, settings|
          container_instance.dependency :transport, -> do
            ::Proxy::RemoteExecution::Ssh::Transport.new(
              settings[:identity_key_file],
              settings[:identity_pubkey_file],
              settings[:user],
              settings[:kerberos_auth]
            )
          end
        end
      end
    end
  end
end
