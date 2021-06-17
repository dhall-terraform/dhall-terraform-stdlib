let BackendResource = ./../backends/types/BackendResource.dhall

let ProviderResource = ./../providers/ProviderResource.dhall

in  { Type =
        { required_version : Optional Text
        , required_providers : List ProviderResource
        , backend : Optional BackendResource
        }
    , default =
      { required_version = None Text
      , required_providers = [] : List ProviderResource
      }
    }
