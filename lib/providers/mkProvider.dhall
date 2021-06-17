let TFUtils = ../utils/package.dhall

let Providers = ./Providers.dhall

let mkProvider = TFUtils.mkRes Providers.Type

in  mkProvider
