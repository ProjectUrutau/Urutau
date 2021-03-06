/**
 * Used into kanban paths
 * 
 * Drag drop is based on :
 * http://www.w3schools.com/html/tryit.asp?filename=tryhtml5_draganddrop
 */
function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("requirement", ev.target.id);
}

function drop(ev, layerID) {

  ev.preventDefault();

  var data = ev.dataTransfer.getData("requirement");
  var requirement = $("#".concat(data))[0];

  // get only number of id
  var requirementID = requirement.id.replace(/[^0-9]/g, '');

  ev.target.appendChild(requirement);

  $.ajax({
    type : "POST",
	  url : "move",
	  data : {
	    requirementID : requirementID,
		layerID : layerID
	  },
	  dataType : "JSON",
	  success : function(result) {
		  console.log(result[1]);
		  $("#message").html(result[1]);
		  // unique .alert div
		  $(".alert-json").fadeIn( "slow" );  
	  }
  });
}

function closeAlert() {
  $(".alert-json").hide();
}

$(document).ready(function() {
  // Hide alert div in begin
  closeAlert();

  $(document).click(function(event) {
    $(".requirement").css('borderWidth', '1px');

	  if ($(event.target).hasClass('requirement')) {
	    $(event.target).css('borderWidth', '3px');
	  }
  });
  
  function activeRequirement(requirement) {
    $(requirement).css('borderWidth', '3px');	  
  }

  $(".requirement").click(function() {
	  activeRequirement(this);
  });
  
  $(".requirement").dblclick(function() {
	  $(this).children(".requirement-link").click();
  });
});
