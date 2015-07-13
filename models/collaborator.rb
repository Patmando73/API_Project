require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"



class Collaborator
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_accessor :id, :username


  def initialize(options = {})
    @id =  options["id"]
    @username = options["username"]
  end
end