Exceptions <- \() {
  exceptions <- list()
  exceptions[['Type.Invalid']]    <- \() { }
  exceptions[['Type.Mismatch']]   <- \() { }
  exceptions[['Value.Invalid']]   <- \() { }
  exceptions[['Value.NULL']]      <- \() { }
  exceptions[['Entity.Invalid']]  <- \() { }
  exceptions[['Entity.NotFound']] <- \() { }
  exceptions[['Entity.Exists']]   <- \() { }
  exceptions[['Rows.Invalid']]    <- \() { }
  return(exceptions)
}