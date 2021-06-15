let BackendType = ./package.dhall

let Map = https://prelude.dhall-lang.org/v20.2.0/Map/Type

let Backends
    : Type
    = BackendType.BackendNames

let BackendResource = Map Text Backends


in  BackendResource
