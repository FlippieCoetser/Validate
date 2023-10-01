describe('Validator',{
  it('Exist',{
    Validator |> expect.exist()
  })
})

describe("When validations <- Validator()",{
  it('then validations is a list',{
    # When
    validations <- Validator()

    # Then
    validations |> expect.list()
  })
})