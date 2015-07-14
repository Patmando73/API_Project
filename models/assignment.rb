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

  def collabs
    results = CONNECTION.execute("SELECT c.username FROM collaborators c JOIN collaborations cl ON c.id = cl.collaborator_id WHERE cl.assignment_id = #{@id};")

    collaborators = []

    results.each do |d|
      collaborators << d["username"]
    end

    return collaborators.join(", ")

  end

  def json_format
    hash = {}
    hash["id"] = self.id
    hash["name"] = self.name
    hash["description"] = self.description
    hash["repo"] = self.repo
    hash["link"] = self.link

    return hash

  end



end