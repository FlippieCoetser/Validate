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

describe("When input |> validate[['Is.Not.NULL']](argument)",{
  it("then no exception is thrown if input is not NULL",{
    # Given
    validate <- Validator()
    
    # When
    input <- ''
    
    # Then
    input |> validate[['Is.Not.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is NULL",{
    # Given
    validate <- Validator()

    argument <- 'input'
    
    expected.error <- paste0("Argument.NULL: '",argument,"' cannot not be NULL.")
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['Is.Not.NULL']](argument) |> expect.error(expected.error)
  })
  it('then input is returned if input is not NULL',{
    # Given
    validate <- Validator()
    
    # When
    input <- ''
    
    # Then
    input |> validate[['Is.Not.NULL']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['Is.Data.Frame']]()",{
  it("then no exception is thrown if input is data.frame",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame()  
    
    # Then
    input |> validate[['Is.Data.Frame']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not data.frame",{
    # Given
    validate <- Validator()
    
    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."
    
    # When
    input <- list() 
    
    # Then
    input |> validate[['Is.Data.Frame']]() |> expect.error(expected.error)
  })
  it('then input is returned if input is data.frame',{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame()  
    
    # Then
    input |> validate[['Is.Data.Frame']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['Is.Character']]()",{
  it("then no exception is thrown if input is character",{
    # Given
    validate <- Validator()
    
    # When
    input <- ''  
    
    # Then
    input |> validate[['Is.Character']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not character",{
    # Given
    validate <- Validator()
    
    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."
    
    # When
    input <- 1 
    
    # Then
    input |> validate[['Is.Character']]() |> expect.error(expected.error)
  })
  it("then input is returned if input is character",{
    # Given
    validate <- Validator()
    
    # When
    input <- ''  
    
    # Then
    input |> validate[['Is.Character']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['Is.Empty']]()",{
  it("then no exception is thrown if input is empty",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame()  
    
    # Then
    input |> validate[['Is.Empty']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not empty",{
    # Given
    validate <- Validator()
    
    expected.error <- "Rows.Invalid: Got 1 rows but expected 0 rows."
    
    # When
    input <- data.frame(var = 1) 
    
    # Then
    input |> validate[['Is.Empty']]() |> expect.error(expected.error)
  })
  it("then input is returned if input is empty",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame()  
    
    # Then
    input |> validate[['Is.Empty']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['Is.Not.Empty']]()",{
  it("then no exception is thrown if input is not empty",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame(var = 1)  
    
    # Then
    input |> validate[['Is.Not.Empty']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is empty",{
    # Given
    validate <- Validator()
    
    expected.error <- "Rows.Invalid: Got 0 rows but expected >0 rows."
    
    # When
    input <- data.frame() 
    
    # Then
    input |> validate[['Is.Not.Empty']]() |> expect.error(expected.error)
  })
  it("then input is returned if input is not empty",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame(var = 1)  
    
    # Then
    input |> validate[['Is.Not.Empty']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['Has.One.Row']]()",{
  it("then no exception is thrown if input has one row",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame(var = 1)  
    
    # Then
    input |> validate[['Has.One.Row']]() |> expect.no.error()
  })
  it("then an exception is thrown if input does not have one row",{
    # Given
    validate <- Validator()
    
    expected.error <- "Rows.Invalid: Got 2 rows but expected 1 rows."
    
    # When
    input <- data.frame(var = 1:2) 
    
    # Then
    input |> validate[['Has.One.Row']]() |> expect.error(expected.error)
  })
  it("then input is returned if input has one row",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame(var = 1)  
    
    # Then
    input |> validate[['Has.One.Row']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['Is.UUID']]()",{
  it("then no exception is thrown if input is UUID",{
    # Given
    validate <- Validator()
    
    # When
    input <- uuid::UUIDgenerate()  
    
    # Then
    input |> validate[['Is.UUID']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not UUID",{
    # Given
    validate <- Validator()
    
    identifier <- 'identifier'
    expected.error <- paste0("Identifier.Invalid: '",identifier,"' is not a valid UUID.")
    
    # When
    input <- '123' 
    
    # Then
    input |> validate[['Is.UUID']](identifier) |> expect.error(expected.error)
  })
  it("then input is returned if input is UUID",{
    # Given
    validate <- Validator()
    
    # When
    input <- uuid::UUIDgenerate()  
    
    # Then
    input |> validate[['Is.UUID']]() |> expect.equal(input)
  })
})