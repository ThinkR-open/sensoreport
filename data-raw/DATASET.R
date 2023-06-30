## code to prepare `data_profiles_toy` dataset goes here

con_db <- connect_db()

data_profiles_toy <- dplyr::tbl(con_db, dplyr::sql("SELECT * FROM PROFILES")) %>%
  dplyr::filter(SESSION == "SESS2301" & PRODUCT %in% c("PROD1", "PROD2", "PROD3", "PROD4")) %>%
  dplyr::select(-SESSION) %>%
  dplyr::collect()

DBI::dbDisconnect(con_db, shutdown = TRUE)

usethis::use_data(
  data_profiles_toy,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_profiles_toy"
)

## code to prepare `data_hedonic_toy` dataset goes here

con_db <- connect_db()

data_hedonic_toy <- dplyr::tbl(con_db, dplyr::sql("SELECT * FROM HEDONIC")) %>%
  dplyr::filter(SESSION == "SESS2301" & PRODUCT %in% c("PROD1", "PROD2", "PROD3", "PROD4")) %>%
  dplyr::select(-SESSION) %>%
  dplyr::collect()

DBI::dbDisconnect(con_db, shutdown = TRUE)

usethis::use_data(
  data_hedonic_toy,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_hedonic_toy"
)

## code to prepare `data_sessions_toy` dataset goes here

con_db <- connect_db()

data_sessions_toy <- dplyr::tbl(con_db, dplyr::sql("SELECT * FROM SESSIONS")) %>%
  dplyr::collect()

DBI::dbDisconnect(con_db, shutdown = TRUE)

usethis::use_data(
  data_sessions_toy,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_sessions_toy"
)

## code to prepare `data_products_toy` dataset goes here

con_db <- connect_db()

data_products_toy <- dplyr::tbl(con_db, dplyr::sql("SELECT * FROM PRODUCTS")) %>%
  dplyr::collect()

DBI::dbDisconnect(con_db, shutdown = TRUE)

usethis::use_data(
  data_products_toy,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_products_toy"
)
