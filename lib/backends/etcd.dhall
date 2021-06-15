let EtcdBackend =
      { Type =
          { path : Text
          , endpoints : Text
          , username : Optional Text
          , password : Optional Text
          }
      , default = {=}
      }

in  EtcdBackend
