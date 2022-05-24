let LocalBackend = ./types/local.dhall

let RemoteBackendDir = ./types/remote.dhall

let RemoteBackend = RemoteBackendDir.RemoteBackend

let BackendNames = ./typeUnions/backend_names.dhall

let mkBackendResource = ../backends/make/mkBackendResource.dhall

let S3Backend = ./types/s3.dhall

let BackendResourceName
    : BackendNames -> Text
    = \(b : BackendNames) ->
        merge
          { local = \(_ : LocalBackend.Type) -> "local"
          , remote = \(_ : RemoteBackend.Type) -> "remote"
          , s3 = \(_: S3Backend.Type) -> "s3"
          }
          b

in  { BackendNames
    , LocalBackend
    , BackendResourceName
    , RemoteBackend
    , mkBackendResource
    }
