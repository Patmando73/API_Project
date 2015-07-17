require "rubygems"
require "bundler/setup"

require "pry"
require "sinatra"
require "sinatra/reloader"
require "sinatra/json"


set :bind, '0.0.0.0'


# SQL/Database
require "sqlite3"
require_relative "database_setup.rb"




require_relative "models/collaborator"
require_relative "models/assignment"
require_relative "models/collaboration"
require_relative "models/user"
require_relative "controllers/api_controller"
require_relative "controllers/main"
require_relative "controllers/assignment"
require_relative "controllers/collaborator"

