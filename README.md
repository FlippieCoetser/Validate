# Validate

![r-universe](https://flippiecoetser.r-universe.dev/badges/Validate)

## Installation

At the time of writing this README, this `Validate` R-Package is not available on CRAN. Use `devtools` to either install from GitHub or Build and Install locally:

### Install via GitHub

1. Use Devtools

```r
devtools::install_github("https://github.com/FlippieCoetser/Validate")
```

### Build and Install Locally

1. Generate `.tar.gz` file

```r
devtools::build()
```

2. Install `.tar.gz` file

```r
install.packages("path_to_file/tar_gz_file", repos = NULL, type="source")
```

## Usage

## Validators

The following list of validators are available:

1. `is.not.NULL`
2. `is.data.frame`
3. `is.character`
4. `is.empty`
5. `is.not.empty`
6. `has.one.row`
7. `is.UUID`

There are two ways to access the validators:

1. Use the library function to load the validators
2. Create a new instance of the `Validator` component using the package namespace

### Using the library function

1. Load the package

```r
library(Validate)
```

2. Create new instance of the `Validator` component

```r
validator <- Validator()
```

### Using the package namespace

1. Create new instance of the `Validator` component

```r
validator <- Validate::Validator()
```

### Using the validators

The `validator` instance created below can be used to perform validation. For example, test if a variable is not null and throw an error is the variable is NULL.

1. Define test variable

```r
variable <- NULL
```

2. Use the `is.not.NULL` validator to test if the variable is not NULL

```r
result <- variable |> validator[['is.not.NULL']]('variable')
```

Because the variable is NULL, an error will the thrown with the following message:

```r
"Argument.NULL: 'variable' cannot not be NULL."
```
