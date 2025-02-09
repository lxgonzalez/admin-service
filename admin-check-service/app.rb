require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'
require_relative 'app/models/admin'

set :bind, '0.0.0.0'
set :port, 1029

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
  'Check Admin Service is running ...'
end

get '/checkAdmin/:email' do
  email = params[:email]

  if email.nil? || email.strip.empty?
    status 400
    return { status: 'Failed', message: 'Email is required' }.to_json
  end

  begin
    is_admin = Admin.exists?(email: email)
    status is_admin ? 200 : 404
    { status: is_admin ? 'OK' : 'Failed', message: is_admin ? 'Admin exists' : 'Admin does not exist' }.to_json
  rescue => e
    puts "Error checking admin: #{e.message}"
    status 500
    { status: 'Failed', message: 'Internal server error' }.to_json
  end
end
