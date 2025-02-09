require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'
require_relative 'app/models/admin'

set :bind, '0.0.0.0'
set :port, 1031

load_balancer_url = ENV['LOAD_BALANCER_URL']

configure do
  allowed_hosts = [
    "localhost", 
    "tu-app.com/",             
    /.*\.elb\.amazonaws\.com$/,
    
  ]

  set :protection, origin_whitelist: allowed_hosts
  set :host_authorization, { allow: allowed_hosts }
end

set :database, { adapter: 'mysql2', database: ENV['DATABASE'], host: ENV['DATASOURCE_URL'], username: ENV['DATASOURCE_USERNAME'], password: ENV['DATASOURCE_PASSWORD'], port: ENV['DATASOURCE_PORT'] }


get '/' do
  'List Admin Service is running ...'
end

# Route to list all admins
get '/admin' do
  begin
    admin = Admin.all
    status 200
    admin.to_json
  rescue StandardError => e
    status 500
    { error: 'Internal server error', message: e.message }.to_json
  end
end
