environment "production"

daemonize false
threads 8,32
workers 3

deploy_to = '[deploy_dir]'
shared_path = '[shared_folder]'
bind       "unix://#{deploy_to}/#{shared_path}/tmp/sockets/puma.sock"
state_path        "#{deploy_to}/#{shared_path}/tmp/sockets/puma.state"
pidfile           "#{deploy_to}/#{shared_path}/tmp/pids/puma.pid"
preload_app!
activate_control_app

# config/puma.rb
on_worker_boot do
  puts 'On workers boot ...'
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end
