## 1.
See code for `boot.js`, `trusted.js`, `mashup1.js`. Without changing this code, write code for `attacker.js` in order to make `trusted.js` execute unwanted code.

> We can write [attacker.js](tp1/attacker.js) that will redefine `XMLHttpRequest` and make it execute unwanted code.

```javascript
XMLHttpRequest = function () {...}
```

## 2.
Change `boot.js` (and if need be `trusted.js`) to avoid the attack.

We can protect `XMLHttpRequest` in [boot.js](tp2/boot.js) by making `XMLHttpRequest` non-configurable and non-writable.

```javascript
(function () {
  var originalXHR = XMLHttpRequest;
  Object.defineProperty(window, "XMLHttpRequest", {
    value: originalXHR,
    writable: false,
    configurable: false,
  });
})();
```

## 3.
Let `adapi.js` be the code for some external gadget.
Assume that code for `adapi.js` has been verified and cannot access `window` directly, however it has access to function `integrator` whenever it is available.
For each of the following versions of the mashup, can the external gadget `adapi.js`:
- read the value of `secret`?
- obtain a pointer to `window`?

### a.

For the v1, the external gadget can read the value of `secret` and obtain a pointer to `window`. See [q3/v1/adapi.js](q3/v1/adapi.js).

### b.

For the v2, the external gadget cannot read the value of `secret` but can obtain a pointer to `window`. See [q3/v2/adapi.js](q3/v2/adapi.js).

### c.

For the v3, the external gadget cannot read the value of `secret` and cannot obtain a pointer to `window`.
