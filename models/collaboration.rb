require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"



class Collaboration
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_accessor :id, :username


  def initialize(options = {})
    @assignment_id =  options["assignment_id"]
    @Collaborators = options["collaborator_id"]
  end


  def self.collabs
    results = CONNECTION.execute("SELECT c.username FROM collaborators c JOIN collaborations cl ON c.id = cl.collaborator_id WHERE cl.assignment_id = 1;")
  end
end

