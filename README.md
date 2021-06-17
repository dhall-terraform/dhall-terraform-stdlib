# Dhall - Terraform Standard Library
## Goals
This repo is intended to be used to help craft terraform json syntax files from
[Dhall](https://dhall-lang.org). The configuration syntax in JSON has some basic
blocks and modules that are created in HCL, and this repo is for storing those
building blocks for usage in other applications

## Implementation Roadmap
- [?] Terraform Root Module
  - [x] Required Providers
  - [x] Backends
  - [x] Required Version of Terraform CLI
  - [ ] Experimental
  - [ ] Provider Metadata
- [x] Resource Blocks for a provider (see [dhall-terraform-libgen](https://github.com/emattiza/dhall-terraform-libgen-template))
- [x] Data Source Blocks for a provider
- [x] Provider Blocks for a provider
- [ ] Variables Blocks
- [ ] Outputs Blocks