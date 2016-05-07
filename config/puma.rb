environment "production"

daemonize false
threads 8,32
workers 3
deploy_to='/var/www/xuanshun'
shared_path="#{deploy_to}/shared"

state_path "#{shared_path}/tmp/sockets/puma.state"
pidfile "#{shared_path}/tmp/pids/puma.pid"
bind "unix://#{shared_path}/sockets/puma.sock"
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
