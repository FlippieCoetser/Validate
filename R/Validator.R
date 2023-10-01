Validator <- \() {
  validators <- list()
  validators[['Is.Not.NULL']]   <- \() {}
  validators[['Is.Data.Frame']] <- \() {}
  validators[['Is.Character']]  <- \() {}
  validators[['Is.Empty']]      <- \() {}
  return(validators)
}