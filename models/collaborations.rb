require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"



class Collaborations
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_accessor :id, :username


  def initialize(options = {})
    @assignment_id =  options["assingment_id"]
    @Collaborators = options["collaborator_id"]
  end
end