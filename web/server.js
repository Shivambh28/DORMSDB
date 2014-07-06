// server.js

// Setup

var express = require('express');
var morgan = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var expressSession = require('express-session');


var https = require('https');
var http = require('http');
var app = express();
var port = 8000;
var Parse = require('parse').Parse;


var auth = require('./auth.js');

// Initialize Parse

Parse.initialize(auth["parse-appid"], auth["parse-key"]);

// configuration

app.use(morgan('dev'));
app.use(cookieParser());
app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(expressSession({secret: auth["session-secret"]}));

// Use routes
var routes = require ("./routes.js")(app, Parse);

// launch

app.listen(port);
console.log("Operating on port " + port);
