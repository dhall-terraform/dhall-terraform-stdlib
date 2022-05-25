let TerraformBlock = ./../lib/terraform/terraform_block.dhall

let BackendPackage = ./../lib/backends/package.dhall

let Backends = BackendPackage.BackendNames

let mkBackendResource = BackendPackage.mkBackendResource

let LocalBackend = ./../lib/backends/types/local.dhall

let ProviderResource = ./../lib/providers/ProviderResource.dhall

let mkProvider = ./../lib/providers/mkProvider.dhall

let Providers = ./../lib/providers/Providers.dhall

let sampleProviders
    : List ProviderResource
    = [ mkProvider
          "aws"
          Providers::{ source = "hashicorp/aws", version = Some ">= 3.0.0" }
      ]

let localBackend = Backends.local LocalBackend.default

let LocalBackendRes = mkBackendResource localBackend

let Result
    : Type
    = { terraform : TerraformBlock.Type
      , providers : Optional (List Providers.Type)
      }

let result
    : Result
    = { terraform = TerraformBlock::{
        , required_version = Some "1.0.0"
        , required_providers = sampleProviders
        , backend = Some LocalBackendRes
        }
      , providers = None (List Providers.Type)
      }

in  result
