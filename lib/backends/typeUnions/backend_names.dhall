let LocalBackend = ./../types/local.dhall

let RemoteBackend = (./../types/remote.dhall).RemoteBackend

let S3Backend = (./../types/s3.dhall)

in  < local : LocalBackend.Type | remote : RemoteBackend.Type | s3 : S3Backend.Type >
