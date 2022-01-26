test_that("output format works", {
  expect_equal(class(voters::getPS())[1],
               "sf")
})

test_that("output format works", {
  expect_equal(class(voters::getPS(spatial = TRUE))[1],
               "sf")
})

test_that("output format works", {
  expect_equal(class(voters::getPS(spatial = FALSE))[1],
               "tbl_df")
})


test_that("id argument works", {
  expect_equal("ps_id" %in% names(voters::getPS(id = TRUE)),
               TRUE)
})


test_that("id argument works", {
  expect_equal("ps_id" %in% names(voters::getPS(id = FALSE)),
               FALSE)
})


df <- voters::getPS(id = TRUE)

df2 <- voters::getPS(id = FALSE)


"ps_id" %in% names(df)
