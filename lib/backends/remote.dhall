let WorkspaceBlockParams
    : Type
    = < name : { name : Optional Text } | prefix : { prefix : Optional Text } >

let RemoteBackend =
      { Type =
          { hostname : Optional Text
          , organization : Text
          , token : Optional Text
          , workspaces : WorkspaceBlockParams
          }
      , default = { hostname = None Text, token = None Text }
      }

in  { RemoteBackend, WorkspaceBlockParams }
