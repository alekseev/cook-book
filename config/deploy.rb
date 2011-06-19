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

set :rvm_ruby_string, '1.9.2@cook_book'
set :rvm_type, :user
set :default_environment, {
  'PATH' => '/usr/local/rvm/gems/ruby-1.9.2-p180@cook_book/bin:/usr/local/rvm/gems/ruby-1.9.2-p180@global/bin:/usr/local/rvm/rubies/ruby-1.9.2-p180/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games',
  'RUBY_VERSION' => 'ruby 1.9.2',
  'GEM_HOME'     => '/usr/local/rvm/gems/ruby-1.9.2-p180@cook_book',
  'GEM_PATH'     => '/usr/local/rvm/gems/ruby-1.9.2-p180@cook_book:/usr/local/rvm/gems/ruby-1.9.2-p180@global',
  'BUNDLE_PATH'  => '/usr/local/rvm/gems/ruby-1.9.2-p180@cook_book'  # If you are using bundler.
}