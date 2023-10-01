describe('Validator',{
  it('Exist',{
    Validator |> expect.exist()
  })
})

describe("When validators <- Validator()",{
  it('then validators is a list',{
    # When
    validators <- Validator()

    # Then
    validators |> expect.list()
  })
  it('then validators contains Is.Not.NULL',{
    # When
    validators <- Validator()

    # Then
    validators[['Is.Not.NULL']] |> expect.exist()
  })
  it('then validators contains Is.Data.Frame',{
    # When
    validators <- Validator()

    # Then
    validators[['Is.Data.Frame']] |> expect.exist()
  })
  it('then validators contains Is.Character',{
    # When
    validators <- Validator()

    # Then
    validators[['Is.Character']] |> expect.exist()
  })
})