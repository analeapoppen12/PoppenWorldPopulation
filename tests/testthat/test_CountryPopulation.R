test_that('Does the country entered exist', {
  expect_error(CountryPopulation(USA))
  expect_error(CountryPopulation(UK))
})
