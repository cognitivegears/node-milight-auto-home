command.litcoffee
=================

This is the main command dispatcher for node-milight-auto-home.  
This class is responsible for listening to events and 
dispatching them to the milight.

Copyright
=========

Copyright (c) 2015 Nathan Byrd. All Rights Reserved.

This file is part of node-milight-auto-home.

node-milight-auto-home is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

node-milight-auto-home is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with node-milight-auto-home.  If not, see 
[gnu.org](http://www.gnu.org/licenses/).

Code
====

First, lets set some default values for auto home functionality

Client settings
---------------


Server settings
---------------

Change these settings as needed to match your configuration.

The following controls the port and IP address the proxy listens on.

    PROXY_PORT = 8181

Data used for discovery of the proxy on the local network
*TODO*: Make these options or pull automatically?

    INT_IP = '10.0.1.29'

Serial settings
---------------

Change these settings as needed to match your configuration.

    TTL_PORT = "/dev/ttyAMA0"
    TTL_SPEED = 9600

Server setup
------------

Use the arp-monitor module

    ArpMonitor = require 'arp-monitor'

Initialize the arp-monitor

    arpMonitor = new ArpMonitor()

Define a main runWith() module to handle the server creation - 
dispatched from the main node-milight-local-proxy.js executable

    exports.runWith = (args) ->

      arpMonitor.on "in", (node) ->
        console.log("IN", node.mac, node.ip)

      arpMonitor.on "out", (node) ->
        console.log("OUT", node.mac, node.ip)
