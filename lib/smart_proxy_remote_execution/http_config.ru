require 'smart_proxy_remote_execution/api'

map "/remote_execution" do
  run Proxy::RemoteExecution::Api
end
