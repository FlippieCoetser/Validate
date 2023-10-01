Validator <- \() {
  validators <- list()
  validators[['Is.Not.NULL']]   <- \() {}
  validators[['Is.Data.Frame']] <- \() {}
  validators[['Is.Character']]  <- \() {}
  validators[['Is.Empty']]      <- \() {}
  validators[['Is.Not.Empty']]  <- \() {}
  validators[['Is.UUID']]       <- \() {}
  return(validators)
}