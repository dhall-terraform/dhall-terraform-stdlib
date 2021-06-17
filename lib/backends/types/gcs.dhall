let GCSBackend =
      { Type =
          { bucket : Text
          , credentials : Optional Text
          , impersonate_service_account : Optional Text
          , impersonate_service_account_delegates : Optional Text
          , access_token : Optional Text
          , prefix : Optional Text
          , encryption_key : Optional Text
          }
      , default =
        { credentials =
              Some env:GOOGLE_BACKEND_CREDENTIALS as Text
            ? Some env:GOOGLE_CREDENTIALS as Text
            ? None Text
        , impersonate_service_account =
            Some env:GOOGLE_IMPERSONATE_SERVICE_ACCOUNT as Text ? None Text
        }
      }

in  GCSBackend
