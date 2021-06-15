let ACL = < private | public-read >

let COSBase =
      { Type =
          { secret_id : Optional Text
          , secret_key : Optional Text
          , region : Optional Text
          , bucket : Text
          , prefix : Optional Text
          , key : Optional Text
          , encrypt : Optional Text
          , acl : Optional ACL
          }
      , default =
        { prefix = Some "env:"
        , key = Some "terraform.tfstate"
        , acl = ACL.private
        }
      }

in  COSBase
