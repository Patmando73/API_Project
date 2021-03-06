get "/api/assignments" do
  @assignments = Assignment.all
  json_array = []

  @assignments.each do |d|
    json_format = d.json_format
    json_format["collaborators"] = d.collabs
    json_array << json_format
  end
  json json_array
end


get "/api/assignments/collaboration" do
  assignment = Assignment.people_worked_with
  json_array = []
  json_hash ={}

  json_hash["collaborators"] = assignment

  json_array << json_hash

  json json_array

end


get "/api/assignments/remove_collaborator/:assignment_id/:collaborator_id" do
  assignment = Assignment.find(params["assignment_id"].to_i)
  if assignment.has_collaborator?(params["collaborator_id"].to_i)
    assignment.remove_collaborator(params["collaborator_id"].to_i)
    json assignment.json_format
  else
    return "#{Collaborator.find(params['collaborator_id']).username} has not been added as a collaborator on #{assignment.name}."
  end
end

post "/api/modify_assignment_confirm" do
  modified_assignment = Assignment.new({"id" => params["id"], "name" => params["name"], "link" => params["link"], "repo" => params["repo"], "description" => params["description"]})
  modified_assignment.save
  # modified_assignment.delete_collaborations
  # modified_assignment.add_to_collaborations(params["assignment"]["collaborator_id"])
  json modified_assignment.json_format
end

get "/api/modify_assignment" do
  @collaborators = Collaborator.all
  erb :"/api/modify_assignment"
end



get "/api/assignments/:id" do
  @assignment = Assignment.find(params["id"])

  json_format = @assignment.json_format
  json_format["collaborators"] = @assignment.collabs
  json_array = []
  json_array << json_format

  json json_array
end

get "/api/specific-collabs/:id" do
  assignments = Collaborator.find(params["id"])

  one = assignments.specific_collab

  array = []

  one.each do |d|
    assign = Assignment.new(d)
    array << assign
  end

  json_array = []

  array.each do |d|
    json_array << d.json_format
  end


  json json_array

end


get "/api/add_user_form" do
  erb :"/api/add-user-form"
end


get "/api/view_users" do
  users = User.all
  json_array = []
  users.each do |d|
    json_array << d.json_format
  end
  json json_array
end


post "/api/add_user" do
  password = BCrypt::Password.create(params["password"])
  new_user = User.add({"email" => params["email"], "password" => password})
  json new_user.json_format
end


get "/api/assignments/new/:name" do
  @assignment = Assignment.add({"name" => params["name"], "repo" => params["repo"], "description" => params["description"], "link" => params["link"]})




  # array = []
  #
  # params["collaborator_id"].split(',').each do |d|
  #
  #   array << d.to_i
  #
  # end
  #
  # array.each do |b|
  #
  #   @assignment_collabs = Collaboration.find(b)
  #
  # end

  json_array = []
  json_format = @assignment.json_format
  # json_format["collaborators"] = @assignment_collabs
  json_array << json_format
  json json_array
end








