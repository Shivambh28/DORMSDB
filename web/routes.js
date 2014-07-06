// routes.js

module.exports = (function(app, Parse) {

  /* PAGES */

  app.get('/', function(req,res){
    res.end("done");
  });

  app.get('/enter', function(req,res){
    res.sendfile("./public/html/database_entry.html");
  });

  app.post('/enter', function(req,res){

    var Hall = Parse.Object.extend("halls");
    var query = new Parse.Query(Hall);
    query.equalTo("hall", req.body.hall);
    query.find({
      success: function(results){
        var Room = Parse.Object.extend("rooms");
        var room = new Room();
        room.set("number", parseInt(req.body.number));
        room.set("hall", results[0]);
        room.set("type", req.body.type);
        room.set("gender", req.body.gender);
        room.set("sink", Boolean(req.body.sink));
        room.set("loggiaAccess", Boolean(req.body.loggiaAccess));
        room.set("rating", 3);

        room.save(null, {
          sucess: function(room){
            console.log(room);
          },
          error: function (room, error){
            console.log(error);
          }
        });
      },
      error: function(error){
        console.log(error);
      }
    });

    res.redirect("/enter");

  });
  /*
  app.get('/halls/:hall', function(req,res){
    res.end(req.params.hall);
  });

  app.get('/room/:room', function(req,res){
    res.end("index.html");
  });

  app.get('/search/:query', function(req,res){
    res.end("index.html");
  });

   app.get('/profile', function(req,res){
    res.end("index.html");
  });

  app.get('/login', function(req,res){
    res.end("index.html");
    // res.redirect('back');
  });

  app.get('/logout', function(req,res){
    res.end("index.html");
  });
*/

  app.get('/signup', function(req,res){
    res.render("./public/views/signup.jade");
  });
  app.get('/signup', function(req,res){
    res.end("index.html");
  });

  /*
  app.get('/api/:query', function(req,res){
    res.json(null);
  });

  /* CONTENT DELIVERY */

  app.get('/css/:page', function(req,res){
    res.sendfile("./public/css" + req.params.page + ".css");
  });

  app.get('/js/:file', function(req,res){
    res.sendfile("./public/js" + req.params.file + ".js");
  });

  app.get ('/image/:file', function(req,res) {
    res.sendfile("/public/images/" + file);

  });
});
