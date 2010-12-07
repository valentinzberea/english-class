$(function(){
	var $inputField = $('<input type="text"></input>');
	$inputField.data.id = 1;
	
	$inputField.mask("aaaaaaa",{
		completed: {
			call : function(input){
				alert('completed' + $(input).val());
			}
		}});
	
	$("#definitions li:eq(0)").append($inputField);
	
	$("#definitions input:eq(0)").focus();
});