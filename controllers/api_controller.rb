get "/api/assignments" do
  @assignments = Assignment.all
  json_array = []

  @assignments.each do |d|
    # json_collabs = {"collaborators" => ""}
    # json_array << d.json_format
    # json_collabs["collaborators"] << d.collabs
    # json_array << json_collabs
    json_format = d.json_format
    json_format["collaborators"] = d.collabs
    json_array << json_format
  end
  json json_array
end



# d.json_format["collaborators"] << d.collabs
# json_array << d.json_format







