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



  def specific_collab
    results = CONNECTION.execute("SELECT * FROM assignments a JOIN collaborations cl on cl.assignment_id = a.id WHERE cl.collaborator_id = #{@id};;")

    assignments = []
    results.each do |d|
      assignments << d

    end


    return assignments
  end
end