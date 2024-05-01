#' Validator'
#' 
#' @description
#' Validator which returns a generic set of validators and accompanied exceptions.
#'  
#' @usage NULL
#' @returns a list value: 
#' * `input |> validate[['is.not.NULL']](argument)`
#' * `input |> validate[['is.data.frame']]()`
#' * `input |> validate[['is.character']]()`
#' * `input |> validate[['is.empty']]()`
#' * `input |> validate[['is.not.empty']]()`
#' * `input |> validate[['has.one.row']]()`
#' * `input |> validate[['is.UUID']](identifier)`
#' @export
Validator <- \() {
  exception <- Exceptions()

  validators <- list()
  validators[['is.not.NULL']]   <- \(input, argument) {
    input |> is.null() |> exception[['argument.NULL']](argument)
    return(input)
  }
  validators[['is.data.frame']] <- \(input) {
    input |> is.data.frame() |> isFALSE() |> exception[['type.mismatch']](input |> class(), 'data.frame')
    return(input)
  }
  validators[['is.character']]  <- \(input) {
    input |> is.character() |> isFALSE() |> exception[['type.mismatch']](input |> class(), 'character')
    return(input)
  }
  validators[['is.empty']]      <- \(input) {
    actual.rows <- input |> nrow()
    actual.rows |> (\(x) x == 0)() |> isFALSE() |> exception[['rows.invalid']](actual.rows,0)
    return(input)
  }
  validators[['is.not.empty']]  <- \(input) {
    actual.rows <- input |> nrow()
    actual.rows |> (\(x) x == 0)() |> isTRUE() |> exception[['rows.invalid']](actual.rows,'>0')
    return(input)
  }
  validators[['has.one.row']]   <- \(input) {
    actual.rows <- input |> nrow()
    actual.rows |> (\(x) x == 1)() |> isFALSE() |> exception[['rows.invalid']](actual.rows,1)
    return(input)
  }
  validators[['is.UUID']]       <- \(input, identifier) {
    pattern <- "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"
    pattern |> grepl(input) |> isFALSE() |> exception[['identifier.invalid']](identifier)
    return(input)
  }
  return(validators)
}