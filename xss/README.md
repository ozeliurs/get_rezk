1. **HTML Context**:
   - URL: `index.php?htmlcontext=<script>alert('XSS')</script>`
   - Payload: `<script>alert('XSS')</script>`
   - [Link](http://localhost:8080/index.php?htmlcontext=%3Cscript%3Ealert(%27XSS%27)%3C%2Fscript%3E)
   - [Link](http://localhost:8080/protected.php?htmlcontext=%3Cscript%3Ealert(%27XSS%27)%3C%2Fscript%3E)

2. **Attribute Context without quotes**:
   - URL: `index.php?attributecontext1=><script>alert('XSS')</script`
   - Payload: `> <script>alert('XSS')</script`
   - [Link](http://localhost:8080/index.php?attributecontext1=%3E%20%3Cscript%3Ealert(%27XSS%27)%3C%2Fscript)

   - Payload: `javascript:alert('XSS')`
   - [Link](http://localhost:8080/protected.php?attributecontext1=javascript:alert())

3. **Attribute Context with double quotes**:
   - URL: `index.php?attributecontext2=" onerror="alert('XSS')`
   - Payload: `" onerror="alert('XSS')`
   - [Link](http://localhost:8080/index.php?attributecontext2=%22%20onerror=%22alert(%27XSS%27))
   - [Link](http://localhost:8080/protected.php?attributecontext2=%22%20onerror=%22alert(%27XSS%27))

4. **Attribute Context with single quotes**:
   - URL: `index.php?attributecontext3=' onerror='alert("XSS")`
   - Payload: `' onerror='alert("XSS")`
   - [Link](http://localhost:8080/index.php?attributecontext3=%27%20onerror=%27alert(%22XSS%22))
   - [Link](http://localhost:8080/protected.php?attributecontext3=%27%20onerror=%27alert(%22XSS%22))

5. **Script Context**:
   - URL: `index.php?scriptcontext=</script><script>alert('XSS')</script>`
   - Payload: `</script><script>alert('XSS')</script>`
   - [Link](http://localhost:8080/index.php?scriptcontext=%3C%2Fscript%3E%3Cscript%3Ealert(%27XSS%27)%3C%2Fscript%3E)
   - [Link](http://localhost:8080/protected.php?scriptcontext=%3C%2Fscript%3E%3Cscript%3Ealert(%27XSS%27)%3C%2Fscript%3E)

6. **Onerror Attribute Context**:
   - URL: `index.php?attributecontextonerror=alert('XSS')`
   - Payload: `alert('XSS')`
   - [Link](http://localhost:8080/index.php?attributecontextonerror=alert('XSS'))
   - [Link](http://localhost:8080/protected.php?attributecontextonerror=alert('XSS'))
