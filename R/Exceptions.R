Exceptions <- \() {
  exceptions <- list()
  exceptions[['Type.Mismatch']]      <- \(invoke, actual, expected) {
    if(invoke) stop("Type.Mismatch: Got '", actual, "' but expected '", expected, "'.", call. = FALSE)
  }
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