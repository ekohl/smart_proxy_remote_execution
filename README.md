# SmartProxyRemoteExecution

This is a rewrite of the original Smart Proxy Remote Execution.

The general design is that there is a plugin that provides basic functionality, such as the API. That has a configuration option `mode` which determines the transport used, which may or may not implement the APIs. For example, an MQTT provider will not implement the SSH public key API.

Technically this is implemented by using providers which are loaded via the Smart Proxy's dependency injection capabilities.

## Installation

See [How_to_Install_a_Smart-Proxy_Plugin](http://projects.theforeman.org/projects/foreman/wiki/How_to_Install_a_Smart-Proxy_Plugin)
for how to install Smart Proxy plugins

This plugin is compatible with Smart Proxy 3.2 or higher.

## Configuration

Configuration options for this plugin are in `/etc/foreman-proxy/settings.d/remote_execution.yml` and include:

* mode: Set the mode to function in

The mode implies a transport used. When this is set to ssh there is additional configuration in `/etc/foreman-proxy/settings.d/remote_execution.yml:

* identity_key_file: Path to the SSH private key. This file must be readable at Smart Proxy startup.
* identity_pubkey_file: Path to the SSH public key. If unspecified it is assumed that the identity_key_file setting with .pub exists. This file must be readable at Smart Proxy startup.
* user: User to use
* kerberos_auth: Whether Kerberos auth is allowed to be used.

## Contributing

Fork and send a Pull Request. Thanks!

## Copyright

Copyright (c) 2022 Ewoud Kohl van Wijngaarden

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
