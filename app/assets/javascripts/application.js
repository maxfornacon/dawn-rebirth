// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cookies_eu
//= require masonry/jquery.masonry
//= require cable
//= require emojionearea
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .


$(document).ready(function() {
	setTimeout(function(){
		$('#notice_wrapper').fadeOut("slow", function(){
			$(this).remove();
		});
	}, 1500);
	setTimeout(function(){
		$('#alert_wrapper').fadeOut("slow", function(){
			$(this).remove();
		});
	}, 4500);

	$('#notice_wrapper').on( "click", function() {
		$('#notice_wrapper').fadeOut("slow", function(){
			$(this).remove();
		});
	});
	$('#alert_wrapper').on( "click", function(){
		$('#alert_wrapper').fadeOut("slow", function(){
			$(this).remove();
		});
	});
});
