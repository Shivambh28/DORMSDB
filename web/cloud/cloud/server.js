// PARSE Configuration
var parse = require('parse').Parse
,   appID= "lxt3Onk4IfZUqJr4CfpvS35lWxj9Q8fhsZuCJjRO"
,   javascriptKey= "7hrpll8o1nWYU1MTEwbSIZkekkZgs2qx4ab9zhZp";
parse.initialize(appID, javascriptKey);


var campus = parse.Object.extend("Campus");
var query = new parse.Query(campus);

var campusData;

query.find({
  success: function(campus){
    // for(var i=0; i<campus.length; ++i){
    //   console.log(campus[i].attributes.name + " | rating: " + campus[i].attributes.avgRating)
    // }
    campusData = campus;
  }
});

// EXPRESSJS Configuration
var express = require("express")
,   bodyParser = require("body-parser")
,   app = express()
,   port = 3000
,   currentUser;

app.use(express.static(__dirname + '/public'));

app.use(bodyParser.urlencoded({
  extended: false
}));

app.get('/', function(req, res){
  res.sendFile(__dirname + '/public/index.html')
})

app.get('/campus', function(req, res){
  res.json(campusData);
});

app.get('/user', function(req, res){
  res.sendFile(__dirname + '/public/user.html')
})

app.post('/user', function(req, res){
  var firstName = req.body.forename
  ,   lastName = req.body.surname
  ,   email = req.body.email
  ,   graduationYear = req.body.gradyear
  ,   password = req.body.password

  var user = parse.Object.extend("User")
  ,   newUser = new user();
  newUser.set("username", email);
  newUser.set("password", password);
  newUser.set("email", email);
  newUser.set("forename", firstName);
  newUser.set("surname", lastName);
  newUser.set("gradyear", graduationYear);
  newUser.save(null, {
    success: function(newUser){
      res.send({
        username: newUser.username,
        success: true
      })
    },
    error: function(newUser){
      res.send({
        success: false,
        username: newUser.username,
        error: error.message
      })
    }
  })
});

app.get('/user/login', function(req, res){
  res.sendFile(__dirname + '/public/login.html');
})
app.post('/user/login', function(req, res){
  parse.User.logIn(req.body.email, req.body.password, {
    success: function(user){
      currentUser = parse.User.current();
      res.send({
        success: true
      });
    },
    error: function(user, error){
      res.send({
        success: false
      })
      console.log(user, error);
    }
  });
});
app.get('/user/info', function(req, res){
  currentUser = parse.User.current();
  if(currentUser){
    res.send(currentUser);
  }else{
    res.send({
      loggedIn: false
    })
  }
})

app.get('/user/logout', function(req, res){
  parse.User.logOut();
  currentUser = parse.User.current();
  res.send({
    loggedIn: false
  })
});
app.listen(port);
