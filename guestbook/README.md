1. Perform a stored XSS attack on `guestbook.php`. Defend this with a CSP header.
2. On `xssme.php`, perform all the attacks and generate `protectedxssme.php` to defend.
   - Do `htmlentities` or `htmlspecialchars` work in every context of `xssme.php`? If not, explain and correct.
3. Write code to defend and attack for each of the contexts described for XSS and DOM-XSS in the OWASP cheatsheets.
4. Investigate how to use Trusted Types for DOM-XSS and the new attack [here](https://portswigger.net/daily-swig/untrusted-types-researcher-demos-trick-to-beat-trusted-types-protection-in-google-chrome).
5. CTFs
