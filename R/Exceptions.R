Exceptions <- \() {
  exceptions <- list()
  exceptions[['Type.Invalid']]       <- \() { }
  exceptions[['Type.Mismatch']]      <- \() { }
  exceptions[['Value.Invalid']]      <- \() { }
  exceptions[['Value.NULL']]         <- \() { }
  exceptions[['Entity.Invalid']]     <- \() { }
  exceptions[['Entity.NotFound']]    <- \() { }
  exceptions[['Entity.Exists']]      <- \() { }
  exceptions[['Rows.Invalid']]       <- \() { }
  exceptions[['Identifier.Invalid']] <- \() { }
  exceptions[['Identifier.Exists']]  <- \() { }
  return(exceptions)
}