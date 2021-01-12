# installs dependencies, runs R CMD check, runs covr::codecov()
do_package_checks(args=c("--as-cran","--install-args=--build"))

get_stage("before_install") %>%
  add_code_step(message("Listing folder and files")) %>%
  add_code_step(getwd()) %>%
  add_code_step(list.files())