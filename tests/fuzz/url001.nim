import sanchar/parse/url, drchaos

proc fuzzTarget(data: string) =
  let parsed = isValidUrl(data)

defaultMutator(fuzzTarget)
