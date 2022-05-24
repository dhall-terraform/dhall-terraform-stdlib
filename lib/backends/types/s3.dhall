let Map = https://prelude.dhall-lang.org/v20.2.0/Map/Type
let List = https://prelude.dhall-lang.org/v20.2.0/List/Type
let S3Backend = 
  {
    Type = 
      { bucket : Text
      , key : Text
      , region : Text 
      , dynamodb_endpoint: Optional Text
      , endpoint: Optional Text
      , iam_endpoint: Optional Text
      , sts_endpoint: Optional Text
      , encrypt: Optional Bool
      , acl: Optional Text
      , access_key: Optional Text
      , secret_key: Optional Text
      , kms_key_id: Optional Text
      , dynamodb_table: Optional Text
      , profile: Optional Text
      , shared_credentials_file: Optional Text
      , token: Optional Text
      , skip_credentials_validation: Optional Bool
      , skip_region_validation: Optional Bool
      , skip_metadata_api_check: Optional Bool
      , sse_customer_key: Optional Text
      , role_arn: Optional Text
      , session_name: Optional Text
      , external_id: Optional Text
      , assume_role_duration_seconds: Optional Integer
      , assume_role_policy: Optional Text
      , assume_role_policy_arns: Optional List Text Text
      , assume_role_tags: Optional Map Text Text
      , assume_role_transitive_tag_keys: Optional List Text Text
      , workspace_key_prefix: Optional Text
      , force_path_style: Optional Bool
      , max_retries: Optional Integer
      } 
  , default =
      { region: env:AWS_REGION as Text ? env:AWS_DEFAULT_REGION as Text ? None Text
      , dynamodb_endpoint: Some env:AWS_DYNAMODB_ENDPOINT as Text ? None Text
      , endpoint: Some env:AWS_S3_ENDPOINT as Text ? None Text
      , iam_endpoint: Some env:AWS_IAM_ENDPOINT as Text ? None Text
      , sts_endpoint: Some env:AWS_STS_ENDPOINT as Text ? None Text
      , encrypt: Some False
      , acl: None Text
      , access_key: None Text
      , secret_key: None Text
      , kms_key_id: None Text
      , dynamodb_table: None Text
      , profile: None Text
      , shared_credentials_file: None Text
      , token: None Text
      , skip_credentials_validation: Some False
      , skip_region_validation: Some False
      , skip_metadata_api_check: Some False
      , sse_customer_key: Some env:AWS_SSE_CUSTOMER_KEY as Text ? None Text
      , role_arn: None Text
      , session_name: None Text
      , external_id: None Text
      , assume_role_policy: None Text
      , workspace_key_prefix: Some "env:"
      , force_path_style: Some False
      , max_retries: Some 5
      }
  }
in  S3Backend
