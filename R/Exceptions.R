Exceptions <- \() {
  exceptions <- list()
  exceptions[['Type.Invalid']]  <- \() {}
  exceptions[['Type.Mismatch']] <- \() { }
  return(exceptions)
}