Exceptions <- \() {
  exceptions <- list()
  exceptions[['Type.Invalid']]  <- \() {}
  exceptions[['Type.Mismatch']] <- \() { }
  exceptions[['Value.Invalid']] <- \() { }
  exceptions[['Value.NULL']]    <- \() { }
  return(exceptions)
}