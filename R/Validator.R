Validator <- \() {
  exception <- Exceptions()

  validators <- list()
  validators[['Is.Not.NULL']]   <- \(input, argument) {
    input |> is.null() |> exception[['Argument.NULL']](argument)
    return(input)
  }
  validators[['Is.Data.Frame']] <- \(input) {
    input |> is.data.frame() |> isFALSE() |> exception[['Type.Mismatch']](input |> class(), 'data.frame')
    return(input)
  }
  validators[['Is.Character']]  <- \(input) {
    input |> is.character() |> isFALSE() |> exception[['Type.Mismatch']](input |> class(), 'character')
    return(input)
  }
  validators[['Is.Empty']]      <- \(input) {
    actual.rows <- input |> nrow()
    actual.rows |> (\(x) x == 0)() |> isFALSE() |> exception[['Rows.Invalid']](actual.rows,0)
    return(input)
  }
  validators[['Is.Not.Empty']]  <- \(input) {
    actual.rows <- input |> nrow()
    actual.rows |> (\(x) x == 0)() |> isTRUE() |> exception[['Rows.Invalid']](actual.rows,'>0')
  }
  validators[['Has.One.Row']]   <- \() {}
  validators[['Is.UUID']]       <- \() {}
  return(validators)
}