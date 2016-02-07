#!/usr/bin/env node

require('coffee-script');
var path = require('path');
var fs   = require('fs');
var lib  = path.join(path.dirname(fs.realpathSync(__filename)), 'lib');

require(lib + '/command').runWith(arguments);
