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



get "/api/assignments/:id" do
  @assignment = Assignment.find(params["id"])

  json_format = @assignment.json_format
  json_format["collaborators"] = @assignment.collabs
  json_array = []
  json_array << json_format

  json json_array
end





