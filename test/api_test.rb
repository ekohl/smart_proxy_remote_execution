require 'test_helper'
require 'smart_proxy_remote_execution/api'

# Test that API returns the correct responses
class RemoteExecutionApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Proxy::RemoteExecution::Api.new
  end

  def test_root
    get '/'
    assert last_response.ok?, "Last response was not ok: #{last_response.body}"
    assert last_response['Content-Type'] == 'application/json'
    response = JSON.parse(last_response.body)
    assert_equal('Hello World!', response)
  end
end
