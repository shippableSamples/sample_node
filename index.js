var express = require("express"),
    nano = require('nano')('http://localhost:5984'),
    app = express();

app.get("/", function (req, res) {
  res.send("Hey buddy!");
});

app.get("/test/", function(req, res) {
  if (req){
    res.send("this is an update")
  } else {
  	console.log("wtf happend?!")
  	console.log("I don't know...")
  }
});

app.listen(3000, function () {
  console.log('hello world again');
  console.log('Express listening on port 3000');
});
