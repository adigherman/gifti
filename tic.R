# installs dependencies, runs R CMD check, runs covr::codecov()
do_package_checks(args=c("--as-cran","--install-args=--build"))

hello<-function()
{
  message('Hello World');
}

get_stage("before_install") %>%
  add_step(hello())