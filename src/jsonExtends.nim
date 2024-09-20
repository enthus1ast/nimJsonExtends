import json

proc toString*(js: JsonNode): string =
  ## Returns the raw string representation of the JsonNode value, without " in str
  case js.kind
  of JString: js.getStr()
  of JNull: ""
  of JBool: $js.getBool()
  of JInt: $js.getInt()
  of JFloat: $js.getFloat()
  of JObject: $js
  of JArray: $js


when isMainModule:
  assert "\"foo\"" == $(%* "foo") ##  "foo"
  assert "foo" == toString(%* "foo") ## foo
  assert "1" == toString(%* 1) 
  assert "13.37" == toString(%* 13.37) 
  assert "" == toString(%* nil) 
  assert "true" == toString(%* true) 
  assert "false" == toString(%* false) 
  assert "{}" == toString(%* {}) 
  assert "[]" == toString(%* []) 
  assert "[]" == toString(%* @[]) 



