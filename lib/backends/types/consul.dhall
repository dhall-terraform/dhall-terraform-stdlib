let HttpScheme = < http | https >

let ConsulBase =
      { Type =
          { path : Text
          , access_token : Text
          , address : Optional Text
          , scheme : HttpScheme
          , datacenter : Optional Text
          , http_auth : Optional Text
          , gzip : Optional Bool
          , lock : Optional Bool
          , ca_file : Optional Text
          , cert_file : Optional Text
          , key_file : Optional Text
          }
      , default =
        { access_token = env:CONSUL_HTTP_TOKEN as Text ? ""
        , address = Some env:CONSUL_HTTP_ADDR as Text ? None Text
        , http_auth = Some env:CONSUL_HTTP_AUTH as Text ? None Text
        , gzip = Some False
        , lock = Some True
        , ca_file = Some env:CONSUL_CACERT as Text ? None Text
        , cert_file = Some env:CONSUL_CLIENT_CERT as Text ? None Text
        , key_file = Some env:CONSUL_CLIENT_KEY as Text ? None Text
        }
      }

in  ConsulBase
