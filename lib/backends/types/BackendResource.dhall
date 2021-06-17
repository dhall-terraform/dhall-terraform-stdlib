let BackendNames = ../typeUnions/backend_names.dhall

let Map = https://prelude.dhall-lang.org/v20.2.0/Map/Type

let Backends
    : Type
    = BackendNames

let BackendResource = Map Text Backends

in  BackendResource
