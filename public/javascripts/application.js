// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
  $('.remote_del')
  .live('ajax:complete', function(evt, xhr, status, error){
  	var $link = $(this);
  	var container = $link.attr("data-container")
  	$link.parent().parent().fadeOut(300);
    $(container).html(xhr.responseText);
  })
});