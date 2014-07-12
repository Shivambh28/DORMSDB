require('cloud/app.js');
/*
hall
number
gender
type
sink, BOOL
loggiaAccess, BOOL
rating, number
*/
Parse.Cloud.define("makeRoom", function(req, res){
  var query = new Parse.Query("halls");
  query.equalTo("hall", req.params.hall);
  query.first({
    success: function(result){

      var Room = Parse.Object.extend("rooms");
      var room = new Room();

      room.set("number", req.params.number);
      room.set("hall", result);
      room.set("gender", req.params.gender);
      room.set("type", req.params.type);
      room.set("sink", req.params.sink);
      room.set("loggiaAccess", req.params.loggiaAccess);
      room.set("rating", req.params.rating);

      room.save(null, {
        success: function(room){
          res.success("Created room: "+ room.get("hall").get("hall") + " " + room.get('number'));
        },
        error: function (room, error){
          res.error("Save Error: " + error.code + " " + error.message);
        }
      });

    },
    error: function(error){
      res.error("Hall Lookup error: " + error.code + " " + error.message);
    }
  });

});
/*
forename
surname
email
password
username
*/
Parse.Cloud.define("makeUser", function(req,res){
  var user= new Parse.User();
  user.set("forename", req.params.forename);
  user.set("surname", req.params.surname);
  user.set("email", req.params.email);
  user.set("password", req.params.password);
  user.set("username", req.params.username);

  user.signUp(null, {
    success: function(user){
      res.success("Successfully signed up " + user.get("forename") + " " + user.get("surname"));
    },
    error: function(user, error){
      res.error("Error: " + error.code + " " + error.message);
    }
  });
});
/*
hall
number
gender
type
sink, BOOL
loggiaAccess, BOOL
rating, number
campus
cluster
*/
Parse.Cloud.define("getRoom", function(req, res){
  var query = new Parse.Query("rooms");
  query.include("halls");
  query.include("clusters");
  query.include("campuses");

  if(req.params.hall){
    var hallQuery= new Parse.Query("halls");
    hallQuery.equalTo("hall", req.params.hall);
    query.matchesQuery("hall", hallQuery);
  }
  if(req.params.cluster){
    console.log("Fetching rooms from " + req.params.cluster);
    var clusterQuery = new Parse.Query("clusters");
    clusterQuery.equalTo("cluster", req.params.cluster);
    var hallsQuery = new Parse.Query("halls");
    hallsQuery.matchesQuery("cluster", clusterQuery);
    query.matchesQuery("hall", hallsQuery);
  }
  if(req.params.campus){
    var campusQuery = new Parse.Query("campuses");
    campusQuery.equalTo("campus", req.params.campus);
    query.matchesQuery("campus", campusQuery);
  }

  query.count({
    success: function(rooms) {
      res.success(rooms);
    },
    error: function(error) {
      res.error(error);
    }
  });
});
