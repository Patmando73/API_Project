get "/add-collaborator-form" do
  erb :"collaborators/add-collaborator-form"
end

get "/view-collaborators" do
  @all = Collaborator.all

  erb :"collaborator/view-collaborators"
end

get "/save-collaborator" do
  @new_collaborator = Collaborator.add({"username" => params["name"]})

  erb :"home"
end