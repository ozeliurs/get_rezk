const express = require("express");
const bodyParser = require("body-parser");
const app = express();

app.use(bodyParser.json());

app.post("/receive-cookie", (req, res) => {
  console.log("Received cookie:", req.body.cookie);
  res.send("Cookie received");
});

app.get("/gadget.js", (req, res) => {
  res.sendFile("gadget.js", { root: __dirname });
});

app.listen(3002, () => {
  console.log("Service 3 running on port 3002");
});
