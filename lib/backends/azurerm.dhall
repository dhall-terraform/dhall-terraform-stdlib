let Environment = < public | china | german | stack | usgovernment >

let LoginBase =
      { Type =
          { storage_account_name : Text
          , container_name : Text
          , key : Text
          , environment : Optional Environment
          , snapshot : Optional Bool
          }
      , default =
        { environment = Some Environment.public, snapshot = Some False }
      }

let AzCliLogin =
      { Type = LoginBase.Type //\\ { resource_group_name : Text }
      , default = {=}
      }

let MSILogin =
      { Type =
              LoginBase.Type
          //\\  { msi_endpoint : Optional Text
                , use_msi : Optional Bool
                , subscription_id : Optional Text
                , tenant_id : Optional Text
                }
      , default =
        { use_msi = Some env:ARM_USE_MSI as Text ? Some True
        , subscription_id = Some env:ARM_SUBSCRIPTION_ID as Text ? None Text
        , tenant_id = Some env:ARM_TENANT_ID as Text ? None Text
        , msi_endpoint = Some env:ARM_MSI_ENDPOINT as Text ? None Text
        }
      }

let AzureADLogin =
      { Type =
              LoginBase.Type
          //\\  { use_azuread_auth : Bool
                , subscription_id : Text
                , tenant_id : Text
                }
      , default.use_azuread_auth = env:ARM_USE_AZUREAD as Text ? True
      }

let AccessKeyLogin =
      { Type = LoginBase.Type //\\ { access_key : Text }, default = {=} }

let SASTokenLogin =
      { Type = LoginBase.Type //\\ { sas_token : Text }, default = {=} }

in  { LoginBase
    , AzCliLogin
    , MSILogin
    , AzureADLogin
    , SASTokenLogin
    , AccessKeyLogin
    , Environment
    }
