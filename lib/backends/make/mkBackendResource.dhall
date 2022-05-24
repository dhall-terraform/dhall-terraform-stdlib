let BackendResource = ../types/BackendResource.dhall

let Backends = ../typeUnions/backend_names.dhall

let LocalBackend = ../types/local.dhall

let RemoteBackend = (../types/remote.dhall).RemoteBackend

let mkBackendResource
    : forall (body : Backends) -> BackendResource
    = \(body : Backends) ->
        merge
          { local =
              \(x : LocalBackend.Type) ->
                [ { mapKey = "local", mapValue = Backends.local x } ]
          , remote =
              \(x : RemoteBackend.Type) ->
                [ { mapKey = "remote", mapValue = Backends.remote x } ]
          , s3 = 
              \(x: RemoteBackend.Type) ->
                [ { mapKey = "s3", mapValue = Backends.s3 x}]
          }
          body

in  mkBackendResource
