require File.expand_path('lib/smart_proxy_remote_execution/version', __dir__)
require 'date'

Gem::Specification.new do |s|
  s.name        = 'smart_proxy_remote_execution'
  s.version     = Proxy::RemoteExecution::VERSION
  s.date        = Date.today.to_s
  s.license     = 'GPL-3.0'
  s.authors     = ['Ewoud Kohl van Wijngaarden']
  s.email       = ['ewoud@kohlvanwijngaarden.nl']
  s.homepage    = 'https://github.com/theforeman/smart_proxy_remote_execution'

  s.summary     = "Remote Execution for Foreman's Smart Proxy"
  s.description = "Remote Execution is a framework, allowing users to run jobs on Foreman managed hosts. It has multiple transports (such as SSH and MQTT) and can function both in push and pull mode."

  s.files       = Dir['{config,lib,bundler.d}/**/*'] + ['README.md', 'LICENSE']
  s.test_files  = Dir['test/**/*']

  s.add_development_dependency('rake')
  s.add_development_dependency('mocha')
  s.add_development_dependency('test-unit')
end
