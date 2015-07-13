require "pry"
require "sinatra"
require "sinatra/reloader"
require "json"


# SQL/Database
require "sqlite3"
require_relative "database_setup.rb"




require_relative "models/collaborator"
require_relative "models/assignment"
require_relative "models/collaboration"
require_relative "controllers/main"
require_relative "controllers/assignment"
require_relative "controllers/collaborator"

