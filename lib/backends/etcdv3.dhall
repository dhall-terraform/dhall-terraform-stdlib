let EtcdV3Backend =
      { Type =
          { endpoints : Text
          , username : Optional Text
          , password : Optional Text
          , prefix : Optional Text
          , lock : Optional Bool
          , cacert_path : Optional Text
          , cert_path : Optional Text
          , key_path : Optional Text
          }
      , default =
        { username = Some env:ETCDV3_USERNAME as Text ? None Text
        , password = Some env:ETCDV3_PASSWORD as Text ? None Text
        , prefix = ""
        , lock = Some True
        }
      }

in  EtcdV3Backend