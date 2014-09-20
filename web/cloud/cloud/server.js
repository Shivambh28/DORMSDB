var parse = require('parse').Parse
,   appID= "lxt3Onk4IfZUqJr4CfpvS35lWxj9Q8fhsZuCJjRO"
,   javascriptKey= "7hrpll8o1nWYU1MTEwbSIZkekkZgs2qx4ab9zhZp";
parse.initialize(appID, javascriptKey);

var campus = parse.Object.extend("Campus");
var query = new parse.Query(campus);

query.find({
  success: function(campus){
    for(var i=0; i<campus.length; ++i){
      console.log(campus[i].attributes.name + " | rating: " + campus[i].attributes.avgRating)
    }
  }
})
