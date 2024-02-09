import unittest
import sanchar/http

suite "basic http client":
  var client = httpClient()
  client.addHeader("User-Agent", "ferus_sanchar testing suite")
  test "http/get":
    let resp = client.get(
      parse("http://motherfuckingwebsite.com")
    )

    doAssert resp.code == 200
    doAssert resp.content.len > 0
