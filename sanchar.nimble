# Package

version       = "2.0.0"
author        = "xTrayambak"
description   = "ferus-sanchar's rewrite"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.0.0"
requires "nph >= 0.3.0"
requires "drchaos >= 0.1.9"

task fmt, "Format code":
  exec "nph src/"

task docgen, "Generate documentation":
  exec "nim doc --project --index:on --outdir:docs src/sanchar/http.nim"
