test_that("Partition works I", {
  expect_equal(Partition(10, 3), list(1:4, 5:7, 8:10))
})
