Exceptions <- \() {
  exceptions <- list()
  exceptions[['Type.Mismatch']]      <- \(invoke, actual, expected) {
    if(invoke) stop("Type.Mismatch: Got '", actual, "' but expected '", expected, "'.", call. = FALSE)
  }
  exceptions[['Argument.NULL']]      <- \(invoke, argument) {
    if(invoke) stop("Argument.NULL: '", argument, "' cannot not be NULL.", call. = FALSE)
  }
  exceptions[['Rows.Invalid']]       <- \(invoke, actual, expected) {
    if(invoke) stop("Rows.Invalid: Got ", actual, " rows but expected ", expected, " rows.", call. = FALSE)
  }
  exceptions[['Identifier.Invalid']] <- \(invoke, identifier) {
    if(invoke) stop("Identifier.Invalid: '", identifier, "' is not a valid UUID.", call. = FALSE)
  } 
  return(exceptions)
}