require('cloud/app.js');

Parse.Cloud.define("makeRoom", function(req, res){
  var query = new Parse.Query("halls");
  query.equalTo("hall", req.params.hall);
  query.find({
    success: function(results){

      var Room = Parse.Object.extend("rooms");
      var room = new Room();

      room.set("number", req.params.number);
      room.set("hall", results[0]);
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
