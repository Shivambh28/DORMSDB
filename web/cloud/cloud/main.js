
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

Parse.Cloud.define("createRoom", function(request, response){

});

Parse.Cloud.define("createUser", function(request, response){
    response.success();
});
