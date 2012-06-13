$(document).ready(function (){
	$('#locators_state option').eq(0).attr('selected','selected');
    city = $('#locators_city').html();
    $('#locators_state').change(function (){
        state = $('#locators_state :selected').text();
        options = $(city).filter("optgroup[label="+state+"]").html();
        if(options)
            $('#locators_city').html(options);
        else
            $('#locators_city').empty();
    });
})