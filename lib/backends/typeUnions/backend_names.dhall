let LocalBackend = ./../types/local.dhall

let RemoteBackend = (./../types/remote.dhall).RemoteBackend

in  < local : LocalBackend.Type | remote : RemoteBackend.Type >
