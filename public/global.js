/**
 * Created by Patmando73 on 7/13/15.
 */


function showAllAssignments (event) {
    event.preventDefault();

    var req = new XMLHttpRequest();
    var route = "/api/assignments";
    req.open("get", route);

    req.addEventListener("load", function() {
        document.getElementById("assignments").innerText = "";
        for (var i = 0; i < this.response.length; i++) {
            var assignment = this.response[i];
            var newDivId = assignment.id;
            var newDiv = document.createElement("li");
            newDiv.id = newDivId;
            newDiv.dataId = assignment.id;
            newDiv.innerText = assignment.name;
            var div = document.getElementById("assignments");
            div.appendChild(newDiv);
            document.getElementById(newDivId).onclick = showThisAssignment;

        }
    });

    req.responseType = "json";
    req.send();
}

document.getElementById("see_all_assignments").onclick = showAllAssignments;

function showThisAssignment (event) {
    event.preventDefault();

    var req = new XMLHttpRequest();
    var route = "api/assignments/" + this.dataId;
    req.open("get", route);

    req.addEventListener("load", function () {
        var assignment = this.response[0];
        document.getElementById("assignments").innerText = "";
        var newDiv = document.createElement("li");
        newDiv.innerText = "Assignment Name - " + assignment.name;
        var div = document.getElementById("assignments");
        div.appendChild(newDiv);

        var newDiv = document.createElement("li");
        newDiv.innerText = "Assignment Description - " + assignment.description;
        var div = document.getElementById("assignments");
        div.appendChild(newDiv);

        var newDiv = document.createElement("a");
        newDiv.innerText = "Assignment Repo - " + assignment.repo;
        newDiv.href = assignment.repo;
        var div = document.getElementById("assignments");
        div.appendChild(newDiv);
    });
    req.responseType = "json";
    req.send();
}


