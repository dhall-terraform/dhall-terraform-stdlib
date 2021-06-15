let JSON =
      https://prelude.dhall-lang.org/v20.2.0/JSON/package.dhall sha256:5f98b7722fd13509ef448b075e02b9ff98312ae7a406cf53ed25012dbc9990ac

let mkRes =
      λ(a : Type) → λ(name : Text) → λ(body : a) → JSON.keyValue a name body

let jsonType
    : Type → Type
    = λ(a : Type) → { mapKey : Text, mapValue : a }

let groupBlocks =
      λ(key : Text) →
      λ(a : Type) →
      λ(body : List (jsonType a)) →
        [ { mapKey = key, mapValue = body } ]

let groupResources =
      λ(key : Text) →
      λ(a : Type) →
      λ(body : List (jsonType a)) →
        { resource = {} }

in  { mkRes, jsonType, groupBlocks, groupResources }
