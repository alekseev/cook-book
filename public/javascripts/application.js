// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//почитать про link_to_function http://apidock.com/rails/ActionView/Helpers/JavaScriptHelper/link_to_function
function destroy() {
  /*if (confirm("Are you sure?")) {
  	alert("+");
  } else {
    alert("-");
  }*/
  return false;
}
$(document).ready(function(){
  $('.remote_del')
  .live('ajax:complete', function(evt, xhr, status, error){
  	var $link = $(this);
  	var container = $link.attr("data-container")
  	$link.parent().parent().fadeOut(300);
    $(container).html(xhr.responseText);
  })
});