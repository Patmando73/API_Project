get "/add-assignment-form" do
  @collabs = Collaborator.all

  erb :"assignment/add-assignment-form"
end

get "/view-assignments" do
  @all = Assignment.all

  erb :"assignment/view-assignments"
end

get "/save-assignment" do
  @new_assignment = Assignment.add({"name" => params["name"], "description" => params["description"], "repo" => params["repo"], "link" => params["link"]})


  params["collaborator_id"].each do |d|

  @assignment_collabs = Collaboration.add({"assignment_id" => @new_assignment.id, "collaborator_id" => d })
  end


  erb :"home"
end