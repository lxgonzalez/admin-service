require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'
require_relative 'app/models/admin'

set :bind, '0.0.0.0'
set :port, 1031


use Rack::Protection::HostAuthorization, allow_all_hosts: true

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
