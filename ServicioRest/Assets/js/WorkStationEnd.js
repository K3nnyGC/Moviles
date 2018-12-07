/*Script de la clase Menu*/
$(".title_menu").click(function () {
	$("#" + this.id + " + div.submenu").slideToggle("fast");
});
/*
$(".action").click(function(){
	$('#content-2').html("<div class='progress'><div class='indeterminate'></div></div>");
	$.post(
		'?action=f1',
		{

		},
		function(data){
  			$('#content-2').html(data);
		}
	);
});
*/

/*Funciones de WorkStation*/
function xs(n){
	salida = "";
	for (var i = n - 1; i >= 0; i--) {
		salida = salida + "X";
	}
	return salida;
}