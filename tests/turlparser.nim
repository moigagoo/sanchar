import unittest
import sanchar/parse/url

suite "url parsing suite":
  test "basic url": # if this fails, we're majestically screwed.
    let url = parse("https://example.com")

    doAssert url.scheme == "https"
    doAssert url.hostname == "example.com"

  test "url paths":
    let url = parse("https://example.com/this/is/a/very/real/path")

    doAssert url.path == "this/is/a/very/real/path", url.path

  test "url queries":
    let url = parse("https://example.com?this_is_a=very_real_query")

    doAssert url.query == "this_is_a=very_real_query", url.query

  test "default protocol ports":
    let
      http = parse("http://example.com")
      ftp = parse("ftp://example.com")
      gemini = parse("gemini://example.com")
      https = parse("https://example.com")
    
    doAssert http.port == 80'u, $http.port
    doAssert https.port == 443'u, $https.port
    doAssert ftp.port == 20'u, $ftp.port
    doAssert gemini.port == 1965'u, $gemini.port

  test "TLDs":
    let
      dotIn = parse("https://india.gov.in")
      dotRu = parse("https://russia.gov.ru")
      dotUa = parse("https://ukraine.gov.ua")
      dotUs = parse("https://usa.gov.us")

      dotCom = parse("https://google.com")
      dotIo = parse("https://icouldntthinkofacleverandfunnydomainthatendswith.io")
    
    doAssert dotIn.getTld == ".gov.in", dotIn.getTld
    doAssert dotRu.getTld == ".gov.ru", dotRu.getTld
    doAssert dotUa.getTld == ".gov.ua", dotUa.getTld
    doAssert dotUs.getTld == ".gov.us", dotUs.getTld
    doAssert dotCom.getTld == ".com", dotCom.getTld
    doAssert dotIo.getTld == ".io", dotIo.getTld

  test "url fragments":
    let url = parse("https://ferus.org#why-ferus-rocks")

    doAssert url.fragment == "why-ferus-rocks", url.fragment
