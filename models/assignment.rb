require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Assignment
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_accessor :id, :name, :description, :repo, :link


  def initialize(options = {})
    @id = options["id"]
    @name = options["name"]
    @description = options["description"]
    @repo = options["repo"]
    @link = options["link"]
  end



end