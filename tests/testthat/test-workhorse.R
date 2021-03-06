test_that(
  "argument errors work: spatial", {

    expect_error(voters::getPS(spatial = "yes"),
                 regexp = "Invalid 'spatial' argument provided. Must be logical")

  }
)


test_that(
  "argument errors work: spatial", {

    expect_error(voters::getPS(spatial = 2),
                 regexp = "Invalid 'spatial' argument provided. Must be logical")


  }
)


test_that(
  "argument errors work: id", {

    expect_error(voters::getPS(id = "yes"),
                 regexp = "Invalid 'id' argument provided. Must be logical")

  }
)

test_that(
  "argument errors work: id", {

    expect_error(voters::getPS(id = 2),
                 regexp = "Invalid 'id' argument provided. Must be logical")


  }
)
