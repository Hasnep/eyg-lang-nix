//// A naive representation of EYG values as a string.
//// Note the returned string can be any size and applications are best of writing their own visualisation.

import eyg/interpreter/break
import eyg/interpreter/value as v
import eyg/ir/dag_json
import gleam/bit_array
import gleam/function
import gleam/int
import gleam/json
import gleam/list
import gleam/string
import multiformats/cid/v1

/// Describe a reason to stop execution
pub fn describe(reason) {
  case reason {
    break.UndefinedVariable(var) -> "variable undefined: " <> var
    break.UndefinedBuiltin(var) -> "builtin undefined: !" <> var
    break.UndefinedReference(id) -> "reference undefined: #" <> v1.to_string(id)
    break.UndefinedRelease(package, release, _cid) ->
      "release undefined: @" <> package <> ":" <> int.to_string(release)
    break.IncorrectTerm(expected, got) ->
      string.concat([
        "unexpected term, expected: ",
        expected,
        " got: ",
        inspect(got),
      ])
    break.MissingField(field) -> "missing record field: " <> field
    break.NoMatch(term) -> "no cases matched for: " <> inspect(term)
    break.NotAFunction(term) -> "function expected got: " <> inspect(term)
    break.UnhandledEffect("Abort", reason) ->
      "Aborted with reason: " <> inspect(reason)
    break.UnhandledEffect(effect, lift) ->
      "unhandled effect " <> effect <> "(" <> inspect(lift) <> ")"
    break.Vacant -> "tried to run a todo"
  }
}

/// Inspect a value.
pub fn inspect(value: v.Value(_, _)) -> String {
  json.to_string(do_inspect(value))
}

fn do_inspect(value: v.Value(_, _)) -> json.Json {
  case value {
    v.String(s) -> json.object([#("string", json.string(s))])
    v.Integer(i) -> json.object([#("integer", json.int(i))])
    v.Binary(b) -> {
      let encoded = bit_array.base64_encode(b, True)
      json.object([#("binary", json.string(encoded))])
    }
    v.Tagged(label, inner) ->
      json.object([
        #(
          "tagged",
          json.object([#("label", json.string(label)), #("", do_inspect(inner))]),
        ),
      ])
    v.Record(fields) ->
      json.object([
        #("record", json.dict(fields, function.identity, do_inspect)),
      ])
    v.LinkedList(items) ->
      json.object([#("list", json.array(items, do_inspect))])
    v.Closure(param, body, env) ->
      json.object([
        #(
          "closure",
          json.object([
            #("param", json.string(param)),
            #("body", dag_json.to_data_model(body)),
            #(
              "env",
              json.object(
                list.map(env, fn(kv) {
                  let #(k, v) = kv
                  #(k, do_inspect(v))
                }),
              ),
            ),
          ]),
        ),
      ])
    v.Partial(func, args) ->
      json.object([
        #(
          "partial",
          json.object([
            #("func", inspect_switch(func)),
            #("args", json.array(args, of: do_inspect)),
          ]),
        ),
      ])
    v.Promise(_) -> todo
  }
}

fn inspect_switch(switch: v.Switch(_)) -> json.Json {
  case switch {
    v.Cons -> json.object([#("Cons", json.null())])
    v.Extend(label) -> json.object([#("Extend", json.string(label))])
    v.Overwrite(label) -> json.object([#("Overwrite", json.string(label))])
    v.Select(label) -> json.object([#("Select", json.string(label))])
    v.Tag(label) -> json.object([#("Tag", json.string(label))])
    v.Match(label) -> json.object([#("Match", json.string(label))])
    v.NoCases -> json.object([#("NoCases", json.null())])
    v.Perform(label) -> json.object([#("Perform", json.string(label))])
    v.Handle(label) -> json.object([#("Handle", json.string(label))])
    v.Resume(context) -> json.object([#("Resume", context)])
    v.Builtin(identifier) ->
      json.object([#("Builtin", json.string(identifier))])
  }
}
