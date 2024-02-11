test_that("OpNormMatrix works", {
  expect_equal(OpNormMatrix(diag(3), 3), diag(3)/3)
})
