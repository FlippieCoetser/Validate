Exceptions <- \() {
  exceptions <- list()
  exceptions[['Type.Invalid']]  <- \() {}
  exceptions[['Type.Mismatch']] <- \() { }
  exceptions[['Value.Invalid']] <- \() { }
  return(exceptions)
}