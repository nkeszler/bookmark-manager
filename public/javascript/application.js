function prepareNewLinkHandler(){
	$('.add-link').click(function(event){
		$.get($(this).attr("href"), function(data){
			if ($('#ajax-form').length == 0) {
    			$("#home_text").prepend("<div id='ajax-form'></div>");
 			}
 			$('#home_text #ajax-form').html(data);
		});
		event.preventDefault();
	});
}

 function checkLinkTitle(chars){
 	var titleTaken;


 }

$(document).ready(function(){
	prepareNewLinkHandler();

	$('input#title').keyup(function(){

		$.get('/link_checker', {value : this.value},
	 		function(data){
	 			var titleTaken = data.name_exists;
	 			if(titleTaken) {
	 				$("input.add-link").hide();
	 			} else {
	 				$("input.add-link").show();
	 			}
	 		});
	});
});