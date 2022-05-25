let TerraformBlock = ./../lib/terraform/terraform_block.dhall

let BackendPackage = ./../lib/backends/package.dhall

let Backends = BackendPackage.BackendNames

let mkBackendResource = BackendPackage.mkBackendResource

let LocalBackend = ./../lib/backends/types/local.dhall

let S3Backend = ./../lib/backends/types/s3.dhall

let ProviderResource = ./../lib/providers/ProviderResource.dhall

let mkProvider = ./../lib/providers/mkProvider.dhall

let Providers = ./../lib/providers/Providers.dhall

let sampleProviders
    : List ProviderResource
    = [ mkProvider
          "aws"
          Providers::{ source = "hashicorp/aws", version = Some ">= 3.0.0" }
      ]

let s3Backend =
      Backends.s3 (S3Backend.default // { bucket = "mine", key = "mine" })

let s3BackendRes = mkBackendResource s3Backend

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
        , backend = Some s3BackendRes
        }
      , providers = None (List Providers.Type)
      }

in  result
