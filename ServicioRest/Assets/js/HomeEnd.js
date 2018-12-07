document.addEventListener('DOMContentLoaded', function() {
			    var elems = document.querySelectorAll('.modal');
			    var instances = M.Modal.init(elems, {"inDuration":50});
			  });

$(document).ready(function () {
    $("body").on("contextmenu",function(e){
        return false;
    });
   window.location.hash="Ready";
   window.location.hash="Ready";
   window.onhashchange=function(){window.location.hash="Ready";}

});


document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems, {});
  });
