$(document).ready(function() {
  $('#' + document.URL.split('/').slice(4,5)).addClass('active');
  $('.nav-tabs li').removeClass('active');
  $('#' + document.URL.split('/').slice(4,5) + '_' + document.URL.split('/')[5]).addClass('active')
});
