(function () {
  var originalXHR = XMLHttpRequest;
  Object.defineProperty(window, "XMLHttpRequest", {
    value: originalXHR,
    writable: false,
    configurable: false,
  });
})();

var i = 0;
