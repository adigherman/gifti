# installs dependencies, runs R CMD check, runs covr::codecov()
do_package_checks(args=c("--as-cran","--install-args=--build"))

# get remotes and try to install binaries
remotes = ghtravis::get_remotes()

if(!is.null(remotes)) {
  for(remote in remotes) {
    remote_info <- ghtravis::parse_remotes(remote)
    github_user <- sapply(remote_info, `[[`, "username")
    repo <- sapply(remote_info, `[[`, "repo")
    slug <- paste0(paste0(github_user,"/",repo))

    if(!is.null(github_user) && !is.null(repo)) {
      get_stage("before_install") %>%
        add_code_step(message(paste0("Installing ",repo," binaries"))) %>%
        add_code_step(ghtravis::install_remote_binaries(check_r_version = TRUE, force_sha = FALSE, remotes = c(slug)))
    }
  }
}

