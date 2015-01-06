var express = require("express"),
    nano = require('nano')('http://localhost:5984'),
    app = express();

app.get("/", function (req, res) {
  res.send("Hey buddy!");
});

app.get("/2", fnction(req, res) {
  res.send("this is an update")
});

app.listen(3000, function () {
  console.log('Express listening on port 3000');
});
