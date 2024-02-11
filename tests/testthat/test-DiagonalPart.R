test_that("DiagonalPart works", {
  expect_equal(DiagonalPart(matrix(1, 3, 3), 3), diag(3))
})
