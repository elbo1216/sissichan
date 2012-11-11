function makeActive(group_id, id) {
  $('#' + group_id).find('li').each(function(index) {
    if($(this).attr('id') == id) {
      $(this).addClass('active');
    } else {
      $(this).removeClass('active');
    }
  });
}
