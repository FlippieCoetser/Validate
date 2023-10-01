Validator <- \() {
  exception <- Exceptions()

  validators <- list()
  validators[['Is.Not.NULL']]   <- \(input, argument) {
    input |> is.null() |> exception[['Argument.NULL']](argument)
  }
  validators[['Is.Data.Frame']] <- \() {}
  validators[['Is.Character']]  <- \() {}
  validators[['Is.Empty']]      <- \() {}
  validators[['Is.Not.Empty']]  <- \() {}
  validators[['Has.One.Row']]   <- \() {}
  validators[['Is.UUID']]       <- \() {}
  return(validators)
}