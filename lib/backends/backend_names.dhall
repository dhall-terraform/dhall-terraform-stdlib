let LocalBackend = ./local.dhall

let RemoteBackend = (./remote.dhall).RemoteBackend

in  < local : LocalBackend.Type | remote : RemoteBackend.Type >
