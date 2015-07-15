/**
 * Created by Patmando73 on 7/15/15.
 */

if (document.body.attributes.data_page_name.value === "modify_assignment") {
    document.getElementById("modify_form").classList.add("hidden");

    function seeAllAssignments() {

        var req = new XMLHttpRequest();
        req.open("get", "/api/assignments");

        req.addEventListener("load", function(){
            document.getElementById("assignments").innerText = "";
            for(var i = 0; i < this.response.length; i++) {
                var assignment = this.response[i]
                var newDivId = "assignment" + assignment.id;
                var newDiv = document.createElement("li");
                newDiv.id = newDivId
                newDiv.dataId = assignment.id
                newDiv.innerText = assignment.name;
                var currentDiv = document.getElementById("assignments");
                currentDiv.appendChild(newDiv);
                document.getElementById(newDivId).onclick = showAssignmentForm;


                // document.body.insertBefore(newDiv, currentDiv.lastChild);
            }
        });
        req.responseType = "json";
        req.send();
    }
    seeAllAssignments();

    function showAssignmentForm() {
        var req = new XMLHttpRequest();
        var route = "/api/assignments/" + this.dataId
        req.open("get", route);

        req.addEventListener("load", function() {
            document.getElementById("modify_form").classList.remove("hidden");
            document.getElementById("name_field").value = this.response[0].name;
            document.getElementById("description_field").value = this.response[0].description;
            document.getElementById("repository_field").value = this.response[0].repo;
            document.getElementById("link_field").value = this.response[0].link;
            document.getElementById("assignment_id_field").value = this.response[0].id;

            checkboxes = document.getElementsByClassName("collaborator_checkbox");
            for (var x = 0; x < checkboxes.length; x++) {
                checkboxes[x].checked = false;
            }

            //for (var x = 0; x < this.response.collaborators.length; x++) {
            //    checkboxName = "collaborator" + this.response.collaborators[x]
            //    document.getElementById(checkboxName).checked = true;
            //}
        })
        req.responseType = "json";
        req.send();
    }
    document.getElementById("submitter").addEventListener("click", modifyAssignment);

    function modifyAssignment(event) {
        event.preventDefault();
        // event.stopPropagation();
        var formElement = document.getElementById("form");
        var request = new XMLHttpRequest();
        request.open("POST", "/api/modify_assignment_confirm");
        request.send(new FormData(formElement));
    }


}