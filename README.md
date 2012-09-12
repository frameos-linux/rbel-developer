# Requirements

* git
* ruby
* rubygems

SSH RW access to the FrameOS Github repositories.

# Getting started

1. Install required gems using bundler:

    bundle install

2. Clone all the repos with the clone_repos.rb script:

    ruby clone_repos.rb

This will create a 'sources' directory and clone all the repos
there. Some clones will fail since the source isn't hosted in Github,
but that's ok.

To update the sources (i.e. git pull on every repo), use:

    bash git_pull_all.sh

# Script list

*build_all.sh*

Build the SRPM and send it to a remote buildbot (pkgwiz remote-build)

Needs a couple of environments variables. See script source.

*clone_repos.rb*

Clone all the Chef package repos and deps

*git_pull_all.sh*

run 'git pull' in every repo to update sources.

*print_dirty_repos.rb*

Print modified (dirty) repositories.

*print_gem_deps.rb*

Print all the gems required as deps by the packages.

