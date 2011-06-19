set :application, "188.127.228.11"

role :app, application
role :web, application
role :db,  application, :primary => true

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:alekseev/cook-book.git"  # Your clone URL
set :scm, "git"
#set :scm_passphrase, "p@ssw0rd"  # The deploy user's password
set :ssh_options, {:forward_agent => true, :port => 22}
set :branch, "master"

set :user, "flint"
set :deploy_to, "/home/flint/projects/cook_book"
set :deploy_via, :remote_cache
set :use_sudo, false