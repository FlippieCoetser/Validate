describe('Exceptions',{
  it('exist',{
    Exceptions |> expect.exist()
  })
})

describe('When exceptions <- Exceptions()',{
  it('then exceptions is a list',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it('then exceptions contains Type.Mismatch',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions[['Type.Mismatch']] |> expect.exist()
  })
  it('then exceptions contains Argument.NULL',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions[['Argument.NULL']] |> expect.exist()
  })
  it('then exceptions contains Rows.Invalid',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions[['Rows.Invalid']] |> expect.exist()
  })
  it('then exceptions contains Identifier.Invalid',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions[['Identifier.Invalid']] |> expect.exist()
  })
})

describe("When input |> exception[['Type.Mismatch']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Type.Mismatch']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Exceptions()
    
    expected <- 'expected'
    actual   <- 'actual'

    expected.error <- paste0("Type.Mismatch: Got '", actual, "' but expected '", expected, "'.")
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Type.Mismatch']](actual, expected) |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Argument.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Argument.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Exceptions()
    
    argument <- 'argument'
    expected.error <- paste0("Argument.NULL: '", argument, "' cannot not be NULL.")
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Argument.NULL']](argument) |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Rows.Invalid']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Rows.Invalid']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Exceptions()
    
    actual  <- 1
    expected <- 0
    expected.error <- paste0("Rows.Invalid: Got ", actual, " rows but expected ", expected, " rows.")
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Rows.Invalid']](actual, expected) |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Identifier.Invalid']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Identifier.Invalid']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Exceptions()
    
    identifier <- 'identifier'
    expected.error <- paste0("Identifier.Invalid: '", identifier, "' is not a valid UUID.")

    # When
    input <- TRUE
    
    # Then
    input |> exception[['Identifier.Invalid']](identifier) |> expect.error(expected.error)
  })
})