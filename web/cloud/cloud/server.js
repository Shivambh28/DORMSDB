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

app.get('/search', function(req, res){
  res.sendFile(__dirname + '/public/search.html');
});

app.post('/search', function(req, res){
  // show rooms based on the user request
  var room = parse.Object.extend('Room');
  var hall = parse.Object.extend('Hall');
  var campus = parse.Object.extend('Campus');
  var cluster = parse.Object.extend('Cluster');
  var floor = parse.Object.extend('Floor');
  var house = parse.Object.extend('House');

  var roomQuery = new parse.Query(room);
  var hallQuery = new parse.Query(hall);
  var campusQuery = new parse.Query(campus);
  var clusterQuery = new parse.Query(cluster);
  var floorQuery = new parse.Query(floor);
  var houseQuery = new parse.Query(house);


  var acCheck = laundryCheck = printerCheck = subsCheck = false;
  var hallList = [];
  if(req.body.room!=""){
    console.log("searching based on room #", req.body.room);
    roomQuery.equalTo("number", req.body.room);
    roomQuery.find({
      success: function(rooms){
        console.log(rooms);
        res.json(rooms);
      }
    });
  }else {
    if(req.body.ac == "checked"){
      hallList.push("AC");
      acCheck = true;
    }
    if(req.body.laundry == "checked"){
      hallList.push("Laundry");
      laundryCheck = true;
    }
    if(req.body.printer == "checked"){
      hallList.push("Printer");
      printerCheck = true;
    }
    if(req.body.subfree == "checked"){
      hallList.push("SubstanceFree");
      subsCheck = true;
    }
    hallQuery.containsAll("specialAttributes", hallList);
    hallQuery.find({
      success: function(halls){
        res.json(halls);
      }
    });
  }
});




app.listen(port);
