test_that("filepath cannot be NULL", {
  expect_error(
    new_shiny_plate(filepath = NULL)
  )
})
