preload_app true

timeout 30
listen "/home/flint/projects/cook_book/current/tmp/sockets/unicorn.sock", :backlog => 64

pid "/home/flint/projects/cook_book/current/tmp/pids/unicorn.pid"

stderr_path "/home/flint/projects/cook_book/current/log/unicorn.stderr.log"
stdout_path "/home/flint/projects/cook_book/current/log/unicorn.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end