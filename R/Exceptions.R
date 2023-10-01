Exceptions <- \() {
  exceptions <- list()
  exceptions[['Type.Invalid']]   <- \() { }
  exceptions[['Type.Mismatch']]  <- \() { }
  exceptions[['Value.Invalid']]  <- \() { }
  exceptions[['Value.NULL']]     <- \() { }
  exceptions[['Entity.Invalid']] <- \() { }
  return(exceptions)
}