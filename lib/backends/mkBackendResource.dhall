let BackendResource = ./BackendResource.dhall

let Backends = (./package.dhall).BackendNames

let LocalBackend = ./local.dhall

let RemoteBackend = (./remote.dhall).RemoteBackend

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
          }
          body

in  mkBackendResource
