
// These two lines are required to initialize Express in Cloud Code.
var express = require('express');
var app = express();

// Global app configuration section
app.set('views', 'cloud/views');  // Specify the folder to find templates
app.set('view engine', 'jade');    // Set the template engine
app.use(express.bodyParser());    // Middleware for reading request body


app.get('/enter', function(req,res){
  res.redirect("/database_entry.html");
});

app.post('/enter', function(req,res){
  Parse.Cloud.run("makeRoom", {
    hall: req.body.hall,
    number: parseInt(req.body.number),
    type: req.body.type,
    gender: req.body.gender,
    sink: Boolean(req.body.sink),
    loggiaAccess: Boolean(req.body.loggiaAccess),
    rating: 3
  }, {
    success: function(result){
      res.redirect("/enter");
    },
    error: function(error){
      res.end("Error: " + error);
    }
  });
});

app.get('/signup', function(req, res){
  res.redirect('/signup.html');
});

app.post('/signup', function(req, res){

  Parse.Cloud.run("makeUser", {
    forename: req.body.forename,
    surname: req.body.surname,
    email: req.body.email,
    password: req.body.password,
    username: req.body.username
  }, {
    success: function(result){
      res.redirect("/login");
    },
    error: function(error){
      res.end("Error: " + error);
    }
  });
});

app.get("/test", function(req, res){
  Parse.Cloud.run("getRoom", {
    campus: "North"
  }, {
    success: function(result){
      res.end("" + result );
    },
    error: function(error){
      res.end("error");
    }
  });
});

app.listen();
