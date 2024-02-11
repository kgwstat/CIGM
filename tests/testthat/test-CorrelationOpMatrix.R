test_that("CorrelationOpMatrix works", {
  expect_equal(CorrelationOpMatrix(diag(3), 3, epsilon = 0), diag(3)/3)
})
