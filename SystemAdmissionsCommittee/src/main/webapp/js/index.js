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