let ArtifactoryBackend =
      { Type =
          { username : Text
          , password : Text
          , url : Text
          , repo : Text
          , subpath : Text
          }
      , default = {=}
      }

in  ArtifactoryBackend
