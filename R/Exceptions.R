Exceptions <- \() {
  exceptions <- list()
  exceptions[['type.mismatch']]      <- \(invoke, actual, expected) {
    if(invoke) stop("Type.Mismatch: Got '", actual, "' but expected '", expected, "'.", call. = FALSE)
  }
  exceptions[['argument.NULL']]      <- \(invoke, argument) {
    if(invoke) stop("Argument.NULL: '", argument, "' cannot not be NULL.", call. = FALSE)
  }
  exceptions[['rows.invalid']]       <- \(invoke, actual, expected) {
    if(invoke) stop("Rows.Invalid: Got ", actual, " rows but expected ", expected, " rows.", call. = FALSE)
  }
  exceptions[['identifier.invalid']] <- \(invoke, identifier) {
    if(invoke) stop("Identifier.Invalid: '", identifier, "' is not a valid UUID.", call. = FALSE)
  } 
  return(exceptions)
}