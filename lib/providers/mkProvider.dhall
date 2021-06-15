let TFUtils = ../utils.dhall
let Providers = ./Providers.dhall
let mkProvider = TFUtils.mkRes Providers.Type
in mkProvider
