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
          res.success("Created room: "+ room.attributes.hall.attributes.hall + " " + room.attributes.number);
        },
        error: function (room, error){
          res.error("Save Error: " + error);
        }
      });

    },
    error: function(error){
      res.error("Hall Lookup error: " + error);
    }
  });

});
