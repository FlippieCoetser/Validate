#' Validator'
#' 
#' @description
#' Validator which returns a generic set of validators and accompanied exceptions.
#'  
#' @usage NULL
#' @returns a list value: 
#' * `input |> validate[['Is.Not.NULL']](argument)`
#' * `input |> validate[['Is.Data.Frame']]()`
#' * `input |> validate[['Is.Character']]()`
#' * `input |> validate[['Is.Empty']]()`
#' * `input |> validate[['Is.Not.Empty']]()`
#' * `input |> validate[['Has.One.Row']]()`
#' * `input |> validate[['Is.UUID']](identifier)`
#' @export
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
    return(input)
  }
  validators[['Has.One.Row']]   <- \(input) {
    actual.rows <- input |> nrow()
    actual.rows |> (\(x) x == 1)() |> isFALSE() |> exception[['Rows.Invalid']](actual.rows,1)
    return(input)
  }
  validators[['Is.UUID']]       <- \(input, identifier) {
    pattern <- "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"
    pattern |> grepl(input) |> isFALSE() |> exception[['Identifier.Invalid']](identifier)
    return(input)
  }
  return(validators)
}