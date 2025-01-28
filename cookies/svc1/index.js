const express = require("express");
const app = express();
const path = require("path");

app.get("/set-cookie-1", (req, res) => {
  res.cookie("service1Cookie", "value1", { httpOnly: false });
  res.send("Cookie from Service 1 set");
});

app.get("/set-cookie-2", (req, res) => {
  res.cookie("service2Cookie", "value2", { httpOnly: false });
  res.sendFile("cookie2.html", { root: __dirname });
});

app.listen(3000, () => {
  console.log("Service 1 running on port 3000");
});
