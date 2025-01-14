const OriginalXMLHttpRequest = XMLHttpRequest;

XMLHttpRequest = function () {
  console.log("HACKED");
  return new OriginalXMLHttpRequest();
};
