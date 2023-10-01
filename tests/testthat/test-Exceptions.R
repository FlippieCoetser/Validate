describe('Exceptions',{
  it('exist',{
    Exceptions |> expect.exist()
  })
})

describe('When exceptions <- Exceptions()',{
  it('then exceptions is a lis',{
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
  it('then exceptions contains Value.Invalid',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions[['Value.Invalid']] |> expect.exist()
  })
  it('then exceptions contains Value.NULL',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions[['Value.NULL']] |> expect.exist()
  })
  it('then exceptions contains Entity.Invalid',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions[['Entity.Invalid']] |> expect.exist()
  })
  it('then exceptions contains Entity.NotFound',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions[['Entity.NotFound']] |> expect.exist()
  })
  it('then exceptions contains Entity.Exists',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions[['Entity.Exists']] |> expect.exist()
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
  it('then exceptions contains Identifier.Exists',{
    # When
    exceptions <- Exceptions()

    # Then
    exceptions[['Identifier.Exists']] |> expect.exist()
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