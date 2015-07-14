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





