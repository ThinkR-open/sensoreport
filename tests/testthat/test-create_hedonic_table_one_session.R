# WARNING - Generated by {fusen} from dev/flat_create_database.Rmd: do not edit by hand

test_that("create_hedonic_table_one_session works", {
  
  withr::with_seed(seed = 123, {
    
    dta_hedonic <- create_hedonic_table_one_session(
      nbprod = 6,
      nbconsumers = 2
    )
    
    expect_equal(object = dta_hedonic,
                 expected = structure(
                   list(
                     PRODUCT = c("PROD1", "PROD2", "PROD3", "PROD4",
                                 "PROD5", "PROD6"),
                     `1` = c(3L, 3L, 2L, 7L, 8L, 10L),
                     `2` = c(4L,
                             1L, 2L, 8L, 10L, 8L)
                   ),
                   row.names = c(NA,-6L),
                   class = c("tbl_df",
                             "tbl", "data.frame")
                 ))
    
  })
})
