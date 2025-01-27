var xmlhttp = new XMLHttpRequest();
var url = "http://host.com:8001/";

function callback() {
  console.log("response received");
}

var call = function () {
  xmlhttp.open("GET", url, true);
  xmlhttp.onreadystatechange = callback;
  xmlhttp.send(null);
};

call();
