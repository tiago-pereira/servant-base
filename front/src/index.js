'use strict';

require('ace-css/css/ace.css');
require('font-awesome/css/font-awesome.css');
require('./app.css');
// Require index.html so it gets copied to dist
require('./index.html');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

// The third value on embed are the initial values for incomming ports into Elm
var app = Elm.Main.embed(mountNode);


var last = 0;

window.onscroll = function(ev) {
    var down = window.scrollY >  last;

    if (down) {
      if (window.scrollY > 0) {
          app.ports.windowScrolled.send(true);
      } else {
          app.ports.windowScrolled.send(false);
      }
    } else {
      if (window.scrollY > 50) {
          app.ports.windowScrolled.send(true);
      } else {
          app.ports.windowScrolled.send(false);
      }
    }



    last = window.scrollY;
};
