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
})