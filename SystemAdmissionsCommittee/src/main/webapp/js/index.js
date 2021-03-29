$(function () {
	$("#t2").on('keyup input', function () {
		if ($("#t1").val() != $("#t2").val()) {
			$("#t3").text("INCORRECT CONFIRM PASSWORD");
			$("#t3").css('color', 'red');
			$("button").hide();
		} else {
			$("#t3").text("Password Confirm");
			$("#t3").css('color', 'black');
			$("button").show();
		}
	});
});

$(document).ready(function() {
		var selItem = localStorage.getItem("locales");
		$('#locales').val(selItem ? selItem : 'en');
		$("#locales").change(function() {
			var selectedOption = $('#locales').val();
			if (selectedOption) {
				window.location.replace('?lang=' + selectedOption);
				localStorage.setItem("locales", selectedOption);
			}
		});
	});