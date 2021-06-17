let HttpBackend =
      { Type =
          { address : Text
          , update_method : Optional Text
          , lock_address : Optional Text
          , lock_method : Optional Text
          , unlock_address : Optional Text
          , unlock_method : Optional Text
          , username : Optional Text
          , password : Optional Text
          , skip_cert_verification : Optional Bool
          , retry_max : Optional Natural
          , retry_wait_min : Optional Natural
          , retry_wait_max : Optional Natural
          }
      , default =
        { update_method = Some env:TF_HTTP_UPDATE_METHOD as Text ? Some "POST"
        , lock_address = Some env:TF_HTTP_LOCK_ADDRESS as Text ? None Text
        , lock_method = Some env:TF_HTTP_LOCK_METHOD as Text ? Some "LOCK"
        , unlock_address = Some env:TF_HTTP_UNLOCK_ADDRESS as Text ? None Text
        , unlock_method = Some env:TF_HTTP_UNLOCK_METHOD as Text ? Some "UNLOCK"
        , username = Some env:TF_HTTP_USERNAME as Text ? None
        , password = Some env:TF_HTTP_PASSWORD as Text ? None
        , skip_cert_verification = Some False
        , retry_max = Some env:TF_HTTP_RETRY_MAX as Text ? Some 2
        , retry_wait_min = Some env:TF_HTTP_RETRY_WAIT_MIN as Text ? Some 1
        , retry_wait_max = Some env:TF_HTTP_RETRY_WAIT_MAX as Text ? Some 30
        }
      }

in  HttpBackend
