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
  it('then validators contains Is.Empty',{
    # When
    validators <- Validator()

    # Then
    validators[['Is.Empty']] |> expect.exist()
  })
  it('then validators contains Is.Not.Empty',{
    # When
    validators <- Validator()

    # Then
    validators[['Is.Not.Empty']] |> expect.exist()
  })
  it('then validators contains Has.One.Row',{
    # When
    validators <- Validator()

    # Then
    validators[['Has.One.Row']] |> expect.exist()
  })
  it('then validators contains Is.UUID',{
    # When
    validators <- Validator()

    # Then
    validators[['Is.UUID']] |> expect.exist()
  })
})