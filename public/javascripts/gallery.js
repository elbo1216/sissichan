function showImage(imageId, totalImages, imagePath, caption, url) {
  var imageContainer = $('.full-image .image-container')
  imageContainer.empty();
  imageContainer
     .css('background-image', "url(" + imagePath + ")")
     .css('background-repeat', "no-repeat")
     .css('width', '435px')
     .css('height', '405px')
     .css('textAlign', 'left')


  /* 
   * Logic to create next/prev photo on large image.  Show left arrow except on  
   * first image.  Show right arrow except on last image.  If the next image
   * belongs on the next/prev page, adjust pagination.
   */
  // Left Link
  if (imageId > 1) {
    $('#image-nav-prev')
     .attr('href', $($('#thumb-'+(imageId-1)).find("a")[0]).attr('href'));
  }

  // Right Link
  if (imageId != totalImages) {
    $('#image-nav-next')
     .attr('href', $($('#thumb-'+(imageId+1)).find("a")[0]).attr('href'));
  }

  var captionLink = caption
  if (url != "") {
    captionLink = $('<a>')
                   .attr('href', url)
                   .attr('target', '_blank')
                   .css('color', '#FEF3F6')
                   .css('font-weight', 'bold')
                   .hover(function() {
                     $(this).css('text-decoration', 'underline')
                    }, function() {
                     $(this).css('text-decoration', 'none')
                    }
                   )
                   .html(caption);

  }
  var imageDiv = $('<div>')
               .css('position', 'absolute')
               .css('float', 'left')
               .css('font-weight', 'bold')
               .css('paddingTop', '385px')
               .css('paddingLeft', '10px')
               .append(captionLink);
  var imageDivShadow = $('<div>')
               .css('position', 'absolute')
               .css('font-weight', 'bold')
               .css('marginTop', '386px')
               .css('marginLeft', '11px')
               .css('color', 'black')
               .append(caption);

  imageContainer.append(imageDivShadow);
  imageContainer.append(imageDiv);

  // Need to reset the page that the thumbnail of the image belongs
  showPage(parseInt($('#thumb-'+imageId).attr('class').split(" ")[1].substring(5)));
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
