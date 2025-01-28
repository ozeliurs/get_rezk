# 1.
Write two different services from the same server that set a cookie. On the client side, include a gadget and try the following things:

- Let the gadget delete the cookie via JavaScript.
- Can the second service delete the cookie of the first? Justify why.
- Let the gadget send the cookie to another server (you can use a different port to simulate this).
- Does the previous item work if the gadget is inside a frame?
- And if the gadget is inside a script and the cookie is initially set as httpOnly?
- And if the gadget is inside a script and the cookie is initially set as secure?

Justify all your answers with code and explanations.

> Click on `Delete Service 1 Cookie`
> Click on `Delete Service 2 Cookie`, No because the cookie belongs to the first service.
> Click on `Send Cookie to Another Server`, no it can't because of the CORS configuration of the server.
> No, because the cors.
> No, because the cookie is set as httpOnly.
> No, because the cookie is set as secure and the request is not https.

# 2.

Implement a CSRF attack and explain, then demonstrate what kind ofSameSite cookie can mitigate this attack.
