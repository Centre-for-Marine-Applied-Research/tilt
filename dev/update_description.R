library(desc)
library(usethis)

use_package("stats")

# functions ---------------------------------------------------------------
set_floors <- function(floors, type = "Imports") {
  for (pkg in names(floors)) {
    desc::desc_set_dep(pkg, type = type, version = floors[[pkg]])
  }
}

set_r_floor <- function() {
  desc::desc_set_dep("R", type = "Depends", version = ">= 4.3")
}


# set floors --------------------------------------------------------------
set_r_floor()

set_floors(c(
  dplyr         = ">= 1.1.0",
  ggplot2       = ">= 3.4.0",
  tidyr         = ">= 1.0.0",
  sensorstrings = ">= 1.0.4"       # filter_dat_to_plot arrived late in 1.0.3
))


# sort and tidy -----------------------------------------------------------
desc::desc_normalize()

