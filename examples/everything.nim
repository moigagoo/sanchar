import sanchar/http

# We'll create our HTTP client here.
var client = httpClient()

# We can add headers like this.
client.addHeader(
  "Totally-Useful-Header",
  "This serves no purpose"
)

# We can modify pre-existing headers like this.
client.addHeader(
  "Totally-Useful-Header",
  "This serves no purpose x2"
)

# Let's parse a URL using sanchar's builtin URL parser!
let url = parse("https://nim-lang.org")

# With our newly obtained URL, we can send a HTTP/GET request like this.
let response = client.get(url)

if response.code == 200:
  echo response.content
else:
  echo "Got an HTTP error code: " & $response.code
