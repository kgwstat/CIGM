test_that("PrecisonOpMatrix works", {
  expect_equal(PrecisionOpMatrix(diag(3), 3, epsilon = 0), diag(3)/3)
})
