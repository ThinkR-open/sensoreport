# WARNING - Generated by {fusen} from dev/flat_create_database.Rmd: do not edit by hand

test_that("create_toy_table works", {
  
  withr::with_seed(seed = 123, {
    
    # Sensory table
    
    senso_table <- create_toy_table(
      nbsessions = 2,
      nbprod = 3,
      nbconsumers = 4,
      type = "senso"
    )
    
    expect_equal(object = senso_table,
                 expected = structure(
                   list(
                     PRODUCT = c(
                       "PROD1",
                       "PROD1",
                       "PROD1",
                       "PROD1",
                       "PROD2",
                       "PROD2",
                       "PROD2",
                       "PROD2",
                       "PROD3",
                       "PROD3",
                       "PROD3",
                       "PROD3",
                       "PROD1",
                       "PROD1",
                       "PROD1",
                       "PROD1",
                       "PROD2",
                       "PROD2",
                       "PROD2",
                       "PROD2",
                       "PROD3",
                       "PROD3",
                       "PROD3",
                       "PROD3"
                     ),
                     SESSION = c(
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302"
                     ),
                     CONSUMER = c(
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4"
                     ),
                     GROUP = c(
                       "rasperry",
                       "pear",
                       "sugar",
                       "apple",
                       "rasperry",
                       "citrus",
                       "pear",
                       "flowers",
                       "citrus",
                       "sugar",
                       "citrus",
                       "pear",
                       "pear",
                       "citrus",
                       "citrus",
                       "vanilla",
                       "vanilla",
                       "apple",
                       "vanilla",
                       "vanilla",
                       "sugar",
                       "citrus",
                       "flowers",
                       "apple"
                     )
                   ),
                   class = c("tbl_df", "tbl", "data.frame"),
                   row.names = c(NA,-24L)
                 ))
    
    # Hedonic table
    
    hedo_table <- create_toy_table(
      nbsessions = 2,
      nbprod = 4,
      nbconsumers = 4,
      type = "hedo"
    )
    
    expect_equal(object = hedo_table,
                 expected = structure(
                   list(
                     PRODUCT = c(
                       "PROD1",
                       "PROD1",
                       "PROD1",
                       "PROD1",
                       "PROD2",
                       "PROD2",
                       "PROD2",
                       "PROD2",
                       "PROD3",
                       "PROD3",
                       "PROD3",
                       "PROD3",
                       "PROD4",
                       "PROD4",
                       "PROD4",
                       "PROD4",
                       "PROD1",
                       "PROD1",
                       "PROD1",
                       "PROD1",
                       "PROD2",
                       "PROD2",
                       "PROD2",
                       "PROD2",
                       "PROD3",
                       "PROD3",
                       "PROD3",
                       "PROD3",
                       "PROD4",
                       "PROD4",
                       "PROD4",
                       "PROD4"
                     ),
                     SESSION = c(
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2301",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302",
                       "SESS2302"
                     ),
                     CONSUMER = c(
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4",
                       "1",
                       "2",
                       "3",
                       "4"
                     ),
                     SCORE = c(
                       3L,
                       3L,
                       5L,
                       1L,
                       2L,
                       4L,
                       4L,
                       1L,
                       7L,
                       6L,
                       7L,
                       7L,
                       6L,
                       8L,
                       10L,
                       8L,
                       4L,
                       1L,
                       4L,
                       1L,
                       5L,
                       2L,
                       5L,
                       3L,
                       10L,
                       10L,
                       7L,
                       6L,
                       8L,
                       10L,
                       6L,
                       10L
                     )
                   ),
                   class = c("tbl_df",
                             "tbl", "data.frame"),
                   row.names = c(NA,-32L)
                 ))
    
  })
})
