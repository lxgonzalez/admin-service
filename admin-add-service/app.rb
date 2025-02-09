require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'
require_relative 'app/models/admin'

set :bind, '0.0.0.0'
set :port, 1028

load_balancer_url = ENV['LOAD_BALANCER_URL']

configure do
  allowed_hosts = [
    "localhost", 
    "tu-app.com/",             
    /.*\.elb\.amazonaws\.com$/,

  # Configura Rack::Protection para permitir estos hosts
  set :protection, origin_whitelist: allowed_hosts
  set :host_authorization, { allow: allowed_hosts }
end
    
  
set :database, { adapter: 'mysql2', database: ENV['DATABASE'], host: ENV['DATASOURCE_URL'], username: ENV['DATASOURCE_USERNAME'], password: ENV['DATASOURCE_PASSWORD'], port: ENV['DATASOURCE_PORT'] }

]

get '/' do
  status 200
  'Add Admin Service is running ...'
end

post '/admin' do
  request_payload = JSON.parse(request.body.read) rescue {}
  email = request_payload['email']

  if email.nil? || email.empty?
    halt 400, { error: 'Email is required' }.to_json
  end

  begin
    admin = Admin.create!(email: email)
    status 201
    admin.to_json
  rescue ActiveRecord::RecordNotUnique
    halt 409, { error: 'Duplicate entry', message: "The email '#{email}' is already in use." }.to_json
  rescue StandardError => e
    halt 500, { error: 'Internal server error', message: e.message }.to_json
  end
end
