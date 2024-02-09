import unittest
import sanchar/http

suite "basic https client":
  var client = httpClient()
  client.addHeader("User-Agent", "ferus_sanchar testing suite")
  test "https/get":
    let resp = client.get(
      parse("https://www.google.com")
    )

    doAssert resp.code == 200
    doAssert resp.content.len > 0
