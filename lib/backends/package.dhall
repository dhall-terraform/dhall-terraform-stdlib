let LocalBackend = ./local.dhall

let RemoteBackendDir = ./remote.dhall

let RemoteBackend = RemoteBackendDir.RemoteBackend

let ArtifactoryBackend = ./artifactory.dhall

let AzureRMBackend = ./azurerm.dhall

let ConsulBackend = ./consul.dhall

let COSBackend = ./cos.dhall

let EtcdBackend = ./etcd.dhall

let EtcdV3Backend = ./etcdv3.dhall

let GCSBackend = ./gcs.dhall

let HTTPBackend = ./http.dhall

let BackendNames = ./backend_names.dhall

let BackendResourceName
    : BackendNames -> Text
    = \(b : BackendNames) ->
        merge
          { local = \(_ : LocalBackend.Type) -> "local"
          , remote = \(_ : RemoteBackend.Type) -> "remote"
          }
          b

in  { BackendNames, LocalBackend, BackendResourceName, RemoteBackend }
