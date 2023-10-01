Exceptions <- \() {
  exceptions <- list()
  exceptions[['Type.Mismatch']]      <- \(invoke, actual, expected) {
    if(invoke) stop("Type.Mismatch: Got '", actual, "' but expected '", expected, "'.", call. = FALSE)
  }
  exceptions[['Value.Invalid']]      <- \() { }
  exceptions[['Argument.NULL']]      <- \(invoke, argument) {
    if(invoke) stop("Argument.NULL: '", argument, "' cannot not be NULL.", call. = FALSE)
  }
  exceptions[['Entity.Invalid']]     <- \() { }
  exceptions[['Entity.NotFound']]    <- \() { }
  exceptions[['Entity.Exists']]      <- \() { }
  exceptions[['Rows.Invalid']]       <- \(invoke, actual, expected) {
    if(invoke) stop("Rows.Invalid: Got ", actual, " rows but expected ", expected, " rows.", call. = FALSE)
  }
  exceptions[['Identifier.Invalid']] <- \() { } 
  exceptions[['Identifier.Exists']]  <- \() { }
  return(exceptions)
}