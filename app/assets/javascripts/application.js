// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .


$(document).ready(function ()
{
	
	$('#form1').submit(function (){
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		
		$('#mask').fadeIn(200);
		$('#mask').fadeTo(200,0.7);
		
		var winH = $(window).height();
		var winW = $(window).width();
		
		$('#dialog').css('top', (winH/2-$('#dialog').height()/2)+"px");
		$('#dialog').css('left', (winW/2-$('#dialog').width()/2)+"px");
		
		$('#dialog').show();
	});
	
	$('.show_img').hover(function (){$(this).fadeTo(100,0.5);}, function(){$(this).fadeTo(100,1);});
	
	$('#search').autocomplete({source:["Kate Spade","Marc Jacobs","Tory Burch","Stuart Weitzman","Burberry","Longchamp","Chloe","MiuMiu","Salvatore Ferragamo"]});
	
	$('.remind_me').click(function (){
		
		var info = $(this).data('info');
		var url = document.location.href;
		$.ajax({
			url: url, 
			type: "POST",
			data: {'ItemName': info[0], 'OldPrice':info[1], 'NewPrice':info[2], 'ItemLink': info[4][1]}
		});
		
				
		var H = $(window).height()/2-$('.ui-dialog').height()/2;
		var W = $(window).width()/2-$('.ui-dialog').width()/2;
		// 		
		// 		$('#send_email').css('top', +"px");
		// 		$('#send_email').css('left', +"px");
		// 		
		// 		$('#send_email').show();
		
		var $dialog = $('#send_email').dialog({
			autoOpen: false, 
			title: 'Send Email',
			width: 350,
			height: 200,
			dialogClass: "email-dialog"
		});
		
		
		$dialog.dialog({
			open: function(event,ui){
				var maskHeight = $(document).height();
				var maskWidth = $(window).width();

				$('#mask').css({'width':maskWidth,'height':maskHeight});
				$('#mask').fadeIn(100);
				$('#mask').fadeTo(100,0.7);
			},			
			close: function(event,ui){
				$('#mask').hide();
			}
		});
		
		$dialog.dialog('open');
		
	});
	
	$('#email_form').validate({
		submitHandler:function(form){
			SubmittingForm();
		},
		rules: {
			email: {
				required: true,
				email: true
			}			
		},
		
		messages: {
			email: "Please enter a valid email address"
		}
	});
});