import eyg/analysis/type_/isomorphic as t
import eyg/interpreter/value as v
import touch_grass/http

pub const label = "Fetch"

pub fn lift() {
  http.request()
}

pub fn lower() {
  t.result(http.response(), t.String)
}

pub const decode = http.request_to_gleam

pub fn encode(result) {
  case result {
    Ok(response) -> v.ok(http.response_to_eyg(response))
    Error(reason) -> v.error(v.String(reason))
  }
}
