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
  it('then validators contains is.not.NULL',{
    # When
    validators <- Validator()

    # Then
    validators[['is.not.NULL']] |> expect.exist()
  })
  it('then validators contains is.data.frame',{
    # When
    validators <- Validator()

    # Then
    validators[['is.data.frame']] |> expect.exist()
  })
  it('then validators contains is.character',{
    # When
    validators <- Validator()

    # Then
    validators[['is.character']] |> expect.exist()
  })
  it('then validators contains is.empty',{
    # When
    validators <- Validator()

    # Then
    validators[['is.empty']] |> expect.exist()
  })
  it('then validators contains is.not.empty',{
    # When
    validators <- Validator()

    # Then
    validators[['is.not.empty']] |> expect.exist()
  })
  it('then validators contains has.one.row',{
    # When
    validators <- Validator()

    # Then
    validators[['has.one.row']] |> expect.exist()
  })
  it('then validators contains is.UUID',{
    # When
    validators <- Validator()

    # Then
    validators[['is.UUID']] |> expect.exist()
  })
})

describe("When input |> validate[['is.not.NULL']](argument)",{
  it("then no exception is thrown if input is not NULL",{
    # Given
    validate <- Validator()
    
    # When
    input <- ''
    
    # Then
    input |> validate[['is.not.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is NULL",{
    # Given
    validate <- Validator()

    argument <- 'input'
    
    expected.error <- paste0("Argument.NULL: '",argument,"' cannot not be NULL.")
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['is.not.NULL']](argument) |> expect.error(expected.error)
  })
  it('then input is returned if input is not NULL',{
    # Given
    validate <- Validator()
    
    # When
    input <- ''
    
    # Then
    input |> validate[['is.not.NULL']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['is.data.frame']]()",{
  it("then no exception is thrown if input is data.frame",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame()  
    
    # Then
    input |> validate[['is.data.frame']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not data.frame",{
    # Given
    validate <- Validator()
    
    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."
    
    # When
    input <- list() 
    
    # Then
    input |> validate[['is.data.frame']]() |> expect.error(expected.error)
  })
  it('then input is returned if input is data.frame',{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame()  
    
    # Then
    input |> validate[['is.data.frame']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['is.character']]()",{
  it("then no exception is thrown if input is character",{
    # Given
    validate <- Validator()
    
    # When
    input <- ''  
    
    # Then
    input |> validate[['is.character']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not character",{
    # Given
    validate <- Validator()
    
    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."
    
    # When
    input <- 1 
    
    # Then
    input |> validate[['is.character']]() |> expect.error(expected.error)
  })
  it("then input is returned if input is character",{
    # Given
    validate <- Validator()
    
    # When
    input <- ''  
    
    # Then
    input |> validate[['is.character']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['is.empty']]()",{
  it("then no exception is thrown if input is empty",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame()  
    
    # Then
    input |> validate[['is.empty']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not empty",{
    # Given
    validate <- Validator()
    
    expected.error <- "Rows.Invalid: Got 1 rows but expected 0 rows."
    
    # When
    input <- data.frame(var = 1) 
    
    # Then
    input |> validate[['is.empty']]() |> expect.error(expected.error)
  })
  it("then input is returned if input is empty",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame()  
    
    # Then
    input |> validate[['is.empty']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['is.not.empty']]()",{
  it("then no exception is thrown if input is not empty",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame(var = 1)  
    
    # Then
    input |> validate[['is.not.empty']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is empty",{
    # Given
    validate <- Validator()
    
    expected.error <- "Rows.Invalid: Got 0 rows but expected >0 rows."
    
    # When
    input <- data.frame() 
    
    # Then
    input |> validate[['is.not.empty']]() |> expect.error(expected.error)
  })
  it("then input is returned if input is not empty",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame(var = 1)  
    
    # Then
    input |> validate[['is.not.empty']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['has.one.row']]()",{
  it("then no exception is thrown if input has one row",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame(var = 1)  
    
    # Then
    input |> validate[['has.one.row']]() |> expect.no.error()
  })
  it("then an exception is thrown if input does not have one row",{
    # Given
    validate <- Validator()
    
    expected.error <- "Rows.Invalid: Got 2 rows but expected 1 rows."
    
    # When
    input <- data.frame(var = 1:2) 
    
    # Then
    input |> validate[['has.one.row']]() |> expect.error(expected.error)
  })
  it("then input is returned if input has one row",{
    # Given
    validate <- Validator()
    
    # When
    input <- data.frame(var = 1)  
    
    # Then
    input |> validate[['has.one.row']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['is.UUID']]()",{
  it("then no exception is thrown if input is UUID",{
    # Given
    validate <- Validator()
    
    # When
    input <- uuid::UUIDgenerate()  
    
    # Then
    input |> validate[['is.UUID']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not UUID",{
    # Given
    validate <- Validator()
    
    identifier <- 'identifier'
    expected.error <- paste0("Identifier.Invalid: '",identifier,"' is not a valid UUID.")
    
    # When
    input <- '123' 
    
    # Then
    input |> validate[['is.UUID']](identifier) |> expect.error(expected.error)
  })
  it("then input is returned if input is UUID",{
    # Given
    validate <- Validator()
    
    # When
    input <- uuid::UUIDgenerate()  
    
    # Then
    input |> validate[['is.UUID']]() |> expect.equal(input)
  })
})