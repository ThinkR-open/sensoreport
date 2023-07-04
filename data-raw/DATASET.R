## code to prepare `data_profiles_toy` dataset goes here

con_db <- connect_db()

data_profiles_toy <- dplyr::tbl(con_db, dplyr::sql("SELECT * FROM PROFILES")) |>
  dplyr::filter(SESSION == "SESS2301" & PRODUCT %in% c("PROD1", "PROD2", "PROD3", "PROD4")) |>
  dplyr::select(-SESSION) |>
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

data_hedonic_toy <- dplyr::tbl(con_db, dplyr::sql("SELECT * FROM HEDONIC")) |>
  dplyr::filter(SESSION == "SESS2301" & PRODUCT %in% c("PROD1", "PROD2", "PROD3", "PROD4")) |>
  dplyr::select(-SESSION) |>
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

data_sessions_toy <- dplyr::tbl(con_db, dplyr::sql("SELECT * FROM SESSIONS")) |>
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

data_products_toy <- dplyr::tbl(con_db, dplyr::sql("SELECT * FROM PRODUCTS")) |>
  dplyr::collect()

DBI::dbDisconnect(con_db, shutdown = TRUE)

usethis::use_data(
  data_products_toy,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_products_toy"
)


## code to prepare `data_coord_real_toy` dataset goes here

res_mapping <- perform_senso_mapping(
  data_profiles = data_profiles_toy,
  data_products = data_products_toy
)

coord_prod <- as.data.frame(res_mapping$res_pca$ind$coord[, 1:2])
colnames(coord_prod) <- c("dim1", "dim2")

vec_x1 <- coord_prod[, "dim1"]
vec_x2 <- coord_prod[, "dim2"]

data_coord_real_toy <- tibble(
  dim1 = vec_x1,
  dim2 = vec_x2
) |>
  mutate(
    dim1dim2 = scale(dim1, center = TRUE, scale = FALSE) * scale(dim2, center = TRUE, scale = FALSE)
  )

usethis::use_data(
  data_coord_real_toy,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_coord_real_toy"
)

## code to prepare `data_grid_toy` dataset goes here

size_x1 <- diff(range(vec_x1))
size_x2 <- diff(range(vec_x2))
grid_by <- max(size_x1, size_x2) / resolution
vec_grid_x1 <- seq(
  from = (min(vec_x1) - size_x1 * 0.05),
  to = (max(vec_x1) + size_x1 * 0.05),
  by = grid_by
)
vec_grid_x2 <- seq(
  from = (min(vec_x2) - size_x2 * 0.05),
  to = (max(vec_x2) + size_x2 * 0.05),
  by = grid_by
)

data_grid_toy <- expand.grid(
  dim1 = vec_grid_x1,
  dim2 = vec_grid_x2
) |>
  mutate(
    dim1dim2 = scale(dim1, center = TRUE, scale = FALSE) * scale(dim2, center = TRUE, scale = FALSE)
  )

usethis::use_data(
  data_grid_toy,
  overwrite = TRUE
)

checkhelper::use_data_doc(
  "data_grid_toy"
)
