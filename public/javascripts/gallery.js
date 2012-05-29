function showImage(imagePath) {
  $('.full-image .image-container')
     .empty()
     .append(
       $('<img src="' + imagePath +'" />r'));
}

function showPage(page) {
  $('.thumb').each( function() {
    if ($(this).hasClass('page-' + page)) {
      $(this).show();
    } else {
      $(this).hide();
    } 
  });
  highlightPageNumber(page);
}

function pageLeft() {
  var currentPage = findCurrentPage();
  if (currentPage > 1) {
    showPage(currentPage - 1);
  }
  highlightPageNumber(currentPage - 1);
}

function pageRight() {
  var currentPage = findCurrentPage();
  if (findMaxPage() != currentPage) {
    showPage(currentPage + 1);
  }
  highlightPageNumber(currentPage + 1);
}

function findCurrentPage() {
  var className = $($('.thumb:visible')[0]).attr('class').split(" ")
  for(i=0;i<className.length;i++) {
    if(className[i].indexOf("page") != -1) {
      return parseInt(className[i].substring(5));
    }
  }
}

function findMaxPage() {
  var maxPage = 1
  $('.thumb').each(function() {
    var className = $(this).attr('class').split(" ");
    for(i=0;i<className.length;i++) {
      if(className[i].indexOf("page") != -1) {
        var page = parseInt(className[i].substring(5));
        if (maxPage < page) {
          maxPage = page;
        }
      }
    }
  });
  return maxPage;
}

function highlightPageNumber(pageNumber) {
  $('.pagination-numbers a').each(function() {
    if(String($(this).html()) == String(pageNumber)) {
      $(this).css('color', '#f390b0');
    } else {
      $(this).css('color', '#4b3905');
    }
  })
}
