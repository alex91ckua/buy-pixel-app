"use strict";

var $j = jQuery.noConflict();

var numberArray = [[53, 24, 89, 75, 95, 99, 45, 63, 35, 37, 6, 22, 88, 90, 88, 26, 51, 49, 98, 3, 90, 100, 95, 97, 77, 53, 100, 97, 82, 8, 100, 81, 92, 36, 61, 94, 35, 39, 34, 63, 75, 13, 100, 96, 96, 93, 90, 92, 62, 100, 52, 95, 72, 12, 59, 54, 7, 98, 96, 35],[53, 52, 1, 29, 42, 29, 48, 73, 39, 41, 79, 5, 97, 64, 74, 59, 3, 57, 5, 66, 59, 40, 41, 22, 13, 55, 44, 99, 96, 82, 75, 95, 93, 67, 94, 88, 55, 43, 79, 5, 29, 3, 35, 57, 79, 30, 13, 45, 41, 32, 25, 61, 91, 52, 1, 96, 9, 14, 89, 98],[83, 13, 96, 51, 29, 56, 99, 15, 32, 31, 12, 17, 21, 70, 54, 62, 77, 98, 21, 47, 31, 5, 41, 39, 17, 58, 30, 14, 76, 95, 4, 53, 68, 49, 26, 91, 7, 79, 9, 41, 76, 28, 65, 60, 43, 45, 88, 4, 20, 51, 13, 72, 87, 82, 78, 18, 48, 17, 88, 96],[66, 95, 66, 49, 92, 18, 88, 68, 80, 51, 8, 65, 44, 57, 65, 25, 74, 34, 28, 21, 48, 96, 54, 85, 37, 33, 64, 60, 6, 63, 47, 70, 62, 65, 58, 29, 52, 82, 74, 59, 17, 18, 28, 60, 2, 8, 76, 44, 33, 78, 37, 38, 27, 87, 50, 78, 10, 21, 85, 76],[57, 88, 24, 7, 17, 71, 61, 37, 77, 22, 84, 25, 7, 85, 22, 49, 52, 29, 37, 24, 22, 73, 90, 14, 6, 11, 67, 97, 59, 32, 63, 16, 4, 22, 16, 67, 86, 20, 16, 65, 42, 61, 85, 61, 90, 73, 77, 31, 26, 61, 91, 51, 28, 99, 46, 3, 5, 56, 65, 79],[15, 44, 41, 27, 9, 87, 15, 70, 35, 74, 5, 21, 53, 77, 87, 67, 38, 77, 82, 7, 40, 70, 50, 18, 2, 24, 4, 56, 10, 50, 96, 74, 80, 93, 91, 30, 56, 67, 47, 73, 29, 33, 10, 58, 8, 59, 68, 86, 11, 14, 80, 57, 93, 47, 98, 78, 87, 41, 99, 83],[7, 86, 65, 95, 39, 26, 41, 10, 46, 75, 36, 18, 29, 5, 63, 2, 1, 20, 56, 86, 68, 81, 33, 1, 91, 30, 97, 66, 72, 64, 60, 51, 74, 63, 44, 51, 14, 86, 47, 1, 10, 7, 63, 45, 2, 17, 81, 41, 83, 45, 28, 58, 98, 3, 48, 80, 86, 97, 5, 46],[9, 100, 55, 81, 29, 22, 90, 9, 17, 23, 53, 42, 83, 6, 82, 15, 65, 75, 77, 93, 72, 15, 78, 56, 58, 91, 20, 99, 65, 20, 79, 60, 73, 60, 83, 58, 92, 59, 24, 89, 42, 50, 3, 77, 81, 50, 62, 9, 68, 4, 39, 94, 57, 16, 16, 33, 76, 19, 95, 14],[24, 16, 70, 84, 14, 81, 88, 31, 45, 97, 40, 75, 58, 2, 49, 39, 51, 76, 29, 29, 69, 54, 18, 84, 40, 78, 27, 70, 69, 24, 43, 67, 25, 77, 76, 17, 42, 6, 67, 21, 47, 88, 97, 98, 27, 16, 46, 62, 69, 12, 57, 92, 20, 33, 26, 79, 63, 45, 81, 91],[92, 90, 37, 5, 49, 68, 71, 2, 90, 64, 10, 94, 53, 32, 11, 24, 37, 27, 56, 77, 55, 70, 90, 78, 71, 73, 10, 26, 4, 31, 99, 98, 18, 34, 18, 66, 15, 45, 8, 60, 90, 61, 81, 77, 13, 15, 58, 89, 40, 86, 35, 91, 77, 22, 6, 6, 49, 19, 13, 100],[83, 36, 32, 53, 2, 27, 52, 93, 12, 6, 1, 69, 7, 71, 37, 69, 24, 72, 59, 96, 66, 55, 57, 32, 62, 34, 12, 48, 84, 68, 66, 83, 92, 9, 3, 4, 77, 48, 84, 64, 39, 99, 55, 80, 52, 62, 89, 37, 22, 58, 12, 1, 45, 52, 63, 94, 68, 82, 59, 80],[84, 25, 36, 11, 36, 16, 43, 30, 78, 54, 88, 70, 55, 83, 56, 64, 49, 67, 78, 24, 83, 5, 58, 69, 85, 98, 10, 40, 52, 34, 32, 1, 1, 18, 49, 31, 98, 13, 90, 17, 78, 7, 22, 74, 21, 5, 46, 26, 5, 45, 98, 18, 72, 84, 16, 93, 10, 13, 31, 52],[97, 74, 37, 89, 9, 47, 48, 81, 12, 55, 44, 24, 32, 24, 6, 17, 59, 32, 42, 66, 50, 7, 7, 31, 84, 31, 19, 48, 32, 91, 64, 14, 13, 21, 38, 31, 10, 54, 15, 53, 46, 54, 89, 34, 43, 58, 51, 7, 62, 5, 34, 19, 30, 13, 5, 93, 75, 25, 92, 99],[34, 90, 28, 95, 62, 69, 38, 58, 2, 59, 84, 82, 87, 13, 86, 58, 43, 41, 28, 8, 9, 24, 63, 25, 46, 84, 46, 65, 45, 24, 80, 82, 92, 85, 69, 69, 12, 6, 61, 100, 73, 12, 4, 73, 88, 58, 76, 22, 66, 89, 63, 4, 39, 21, 81, 64, 57, 15, 9, 100],[32, 62, 45, 22, 79, 96, 3, 70, 4, 48, 9, 66, 1, 46, 56, 64, 41, 43, 56, 1, 61, 53, 59, 19, 29, 41, 18, 3, 73, 70, 27, 20, 81, 32, 41, 77, 38, 6, 9, 68, 12, 44, 76, 42, 62, 91, 73, 81, 69, 75, 33, 32, 14, 89, 87, 94, 68, 23, 31, 89],[98, 88, 45, 1, 27, 20, 9, 39, 55, 32, 9, 46, 94, 71, 96, 25, 17, 15, 78, 48, 93, 95, 15, 54, 91, 31, 46, 54, 36, 71, 4, 36, 94, 84, 40, 16, 52, 65, 11, 82, 93, 38, 37, 4, 47, 74, 15, 82, 71, 32, 23, 17, 4, 85, 64, 37, 63, 30, 64, 71],[46, 40, 43, 86, 93, 71, 62, 74, 43, 16, 44, 20, 28, 75, 32, 50, 67, 85, 60, 22, 55, 8, 48, 70, 47, 11, 2, 44, 6, 3, 60, 83, 63, 38, 33, 21, 91, 14, 36, 23, 99, 17, 83, 73, 74, 15, 23, 17, 70, 5, 93, 51, 36, 33, 54, 15, 47, 64, 29, 98],[38, 60, 98, 96, 52, 71, 49, 68, 92, 48, 38, 61, 74, 85, 38, 38, 53, 5, 17, 2, 17, 12, 95, 47, 65, 76, 90, 30, 18, 64, 69, 44, 42, 33, 10, 20, 12, 2, 27, 6, 96, 88, 44, 30, 63, 9, 68, 79, 59, 96, 79, 72, 73, 14, 20, 14, 89, 60, 40, 91],[96, 53, 82, 5, 70, 85, 55, 69, 37, 93, 72, 61, 75, 9, 75, 56, 56, 82, 31, 23, 38, 48, 91, 74, 62, 45, 11, 53, 33, 95, 55, 99, 7, 30, 13, 94, 23, 73, 46, 4, 44, 88, 92, 73, 68, 61, 52, 39, 54, 14, 43, 53, 82, 26, 83, 30, 23, 39, 30, 52],[90, 18, 60, 72, 41, 22, 57, 95, 73, 41, 85, 37, 27, 98, 61, 75, 91, 11, 29, 26, 60, 14, 41, 58, 25, 32, 5, 85, 17, 18, 93, 69, 15, 10, 38, 94, 19, 63, 69, 24, 8, 90, 62, 53, 16, 75, 35, 100, 42, 95, 12, 9, 80, 82, 37, 51, 54, 28, 30, 95],[38, 96, 88, 39, 55, 38, 90, 87, 100, 36, 68, 7, 10, 34, 60, 75, 70, 72, 98, 65, 6, 60, 34, 58, 77, 92, 41, 84, 51, 10, 44, 73, 49, 87, 53, 79, 1, 47, 51, 9, 19, 22, 56, 54, 61, 25, 85, 93, 12, 39, 3, 4, 94, 46, 49, 22, 56, 85, 33, 96],[86, 35, 76, 96, 72, 16, 34, 65, 25, 4, 79, 76, 40, 84, 82, 99, 59, 28, 97, 31, 64, 93, 38, 21, 42, 42, 37, 89, 50, 34, 11, 76, 31, 36, 69, 35, 91, 85, 78, 67, 27, 83, 98, 21, 67, 62, 63, 24, 25, 63, 49, 16, 59, 43, 88, 71, 58, 25, 43, 3],[78, 25, 27, 93, 45, 80, 55, 50, 8, 57, 82, 1, 87, 19, 55, 82, 72, 21, 49, 26, 7, 80, 13, 20, 23, 52, 12, 64, 35, 19, 50, 97, 60, 82, 85, 72, 75, 36, 100, 1, 18, 52, 64, 86, 20, 18, 21, 30, 32, 34, 39, 24, 74, 93, 85, 16, 28, 47, 42, 61],[81, 5, 56, 44, 71, 77, 54, 87, 17, 65, 51, 65, 23, 2, 74, 34, 55, 26, 86, 48, 35, 56, 10, 21, 52, 14, 35, 4, 87, 16, 75, 27, 86, 69, 97, 91, 60, 48, 69, 96, 78, 14, 19, 19, 82, 21, 66, 89, 99, 80, 34, 99, 6, 54, 62, 23, 33, 5, 97, 41],[86, 78, 28, 8, 19, 16, 64, 21, 93, 81, 47, 2, 55, 91, 63, 8, 25, 2, 58, 74, 25, 73, 61, 28, 65, 3, 63, 36, 68, 48, 3, 64, 99, 5, 8, 46, 40, 13, 36, 34, 6, 62, 100, 47, 13, 39, 4, 66, 33, 65, 50, 39, 2, 68, 73, 51, 23, 8, 53, 87],[23, 42, 84, 7, 57, 100, 27, 20, 77, 4, 8, 14, 23, 53, 91, 11, 83, 71, 52, 11, 87, 85, 12, 13, 75, 95, 6, 5, 16, 71, 33, 42, 19, 85, 42, 6, 19, 54, 15, 10, 29, 91, 49, 39, 42, 35, 30, 55, 79, 34, 37, 90, 19, 21, 93, 99, 84, 67, 70, 72],[55, 95, 1, 28, 79, 27, 52, 81, 11, 45, 8, 28, 34, 31, 50, 2, 43, 94, 69, 10, 10, 80, 83, 31, 66, 13, 37, 70, 47, 95, 17, 76, 60, 51, 43, 39, 72, 83, 36, 77, 72, 30, 64, 90, 21, 87, 37, 68, 8, 14, 17, 99, 67, 15, 76, 35, 87, 44, 25, 45],[98, 21, 19, 95, 38, 94, 4, 67, 4, 73, 59, 93, 28, 80, 3, 26, 31, 11, 88, 57, 14, 12, 89, 29, 2, 44, 85, 40, 20, 74, 57, 22, 70, 85, 28, 65, 32, 82, 23, 10, 35, 40, 33, 68, 64, 29, 20, 54, 1, 23, 98, 41, 11, 26, 98, 10, 92, 25, 1, 70],[77, 76, 84, 48, 66, 15, 89, 64, 62, 75, 16, 82, 42, 50, 70, 27, 95, 39, 43, 94, 17, 75, 59, 56, 71, 43, 69, 23, 45, 72, 47, 44, 7, 75, 38, 34, 69, 45, 89, 80, 78, 97, 62, 61, 79, 56, 59, 59, 49, 49, 35, 42, 79, 85, 69, 22, 48, 22, 77, 89],[70, 50, 80, 2, 24, 41, 43, 11, 86, 72, 88, 60, 37, 57, 72, 66, 80, 40, 32, 8, 59, 67, 28, 98, 9, 46, 76, 81, 33, 11, 71, 52, 60, 23, 52, 74, 59, 66, 23, 67, 91, 87, 31, 79, 78, 36, 1, 29, 67, 22, 80, 64, 72, 20, 3, 86, 33, 20, 19, 15],[54, 51, 15, 19, 50, 16, 40, 73, 8, 27, 73, 25, 53, 94, 50, 66, 61, 87, 27, 34, 49, 49, 32, 68, 65, 30, 46, 32, 84, 92, 92, 63, 58, 24, 36, 56, 26, 68, 89, 76, 67, 53, 27, 99, 28, 19, 56, 94, 18, 30, 90, 51, 10, 92, 54, 42, 54, 1, 17, 100],[20, 14, 74, 46, 4, 22, 74, 8, 46, 87, 18, 97, 80, 39, 42, 74, 14, 31, 53, 29, 52, 98, 81, 63, 22, 45, 23, 40, 35, 57, 61, 92, 20, 60, 13, 92, 89, 66, 48, 1, 8, 94, 39, 86, 30, 84, 2, 44, 36, 55, 6, 32, 8, 66, 19, 37, 79, 73, 8, 57],[35, 80, 44, 10, 14, 83, 31, 45, 85, 3, 95, 47, 51, 43, 54, 89, 7, 71, 2, 46, 34, 40, 44, 40, 57, 90, 39, 43, 42, 28, 56, 25, 34, 91, 27, 75, 62, 25, 17, 70, 12, 27, 29, 4, 3, 44, 36, 48, 40, 67, 71, 95, 15, 71, 84, 98, 50, 49, 33, 33],[92, 79, 77, 90, 67, 37, 67, 20, 46, 92, 84, 97, 12, 83, 21, 65, 31, 3, 68, 86, 81, 93, 26, 78, 85, 71, 11, 36, 12, 38, 68, 49, 35, 36, 45, 12, 63, 62, 81, 76, 84, 95, 74, 16, 46, 74, 26, 100, 24, 96, 10, 43, 37, 24, 20, 68, 51, 78, 3, 97],[90, 83, 37, 19, 14, 6, 50, 93, 16, 99, 87, 69, 67, 84, 9, 47, 9, 12, 1, 35, 47, 27, 29, 12, 77, 6, 39, 8, 43, 94, 26, 18, 33, 42, 11, 72, 61, 27, 99, 53, 70, 11, 46, 61, 15, 82, 41, 8, 51, 13, 45, 94, 58, 95, 28, 43, 56, 42, 66, 62],[94, 80, 25, 15, 42, 79, 11, 2, 66, 1, 86, 78, 3, 83, 29, 30, 16, 55, 2, 31, 10, 96, 18, 81, 6, 35, 71, 11, 67, 80, 34, 88, 26, 28, 84, 98, 83, 18, 20, 51, 9, 7, 47, 13, 35, 78, 69, 47, 7, 50, 24, 39, 88, 41, 46, 34, 88, 26, 92, 86],[26, 61, 44, 57, 77, 21, 26, 57, 1, 55, 72, 25, 86, 13, 97, 6, 40, 6, 18, 96, 27, 47, 78, 20, 36, 70, 19, 40, 65, 63, 3, 71, 38, 89, 24, 66, 83, 9, 87, 89, 71, 30, 28, 57, 64, 38, 44, 30, 54, 61, 38, 93, 24, 94, 38, 35, 5, 38, 86, 26],[79, 26, 76, 76, 76, 30, 87, 19, 67, 40, 29, 22, 62, 82, 47, 49, 88, 50, 57, 65, 7, 83, 58, 23, 36, 60, 7, 80, 26, 92, 23, 41, 45, 25, 36, 75, 5, 60, 76, 50, 75, 83, 33, 77, 14, 69, 3, 57, 80, 9, 2, 50, 54, 30, 73, 12, 73, 75, 29, 16],[79, 96, 81, 7, 19, 100, 51, 40, 97, 11, 28, 99, 2, 33, 48, 56, 74, 64, 71, 23, 11, 59, 63, 66, 57, 13, 90, 79, 11, 52, 55, 100, 4, 15, 50, 7, 80, 86, 32, 56, 21, 40, 50, 92, 72, 62, 53, 48, 51, 59, 13, 41, 43, 54, 68, 44, 49, 79, 53, 94],[99, 58, 66, 72, 22, 89, 49, 58, 94, 86, 90, 18, 87, 48, 70, 97, 48, 21, 100, 89, 65, 33, 100, 97, 97, 3, 87, 88, 17, 91, 84, 97, 76, 100, 94, 91, 58, 81, 78, 61, 78, 100, 55, 31, 81, 35, 23, 99, 81, 88, 43, 59, 97, 60, 100, 52, 99, 18, 100, 92]];


$j( document ).on('turbolinks:load', function() {

    afterglow.init();
    FontAwesome.dom.i2svg();

  // Smooth scrolling to internal links
  $j('a[href^="#"]').on('click',function (e) {
	  e.preventDefault();
    if ($j(this).hasClass("carousel-control-prev")  || $j(this).hasClass("carousel-control-next")  || $j(this).hasClass("afterglow")) { return };
	  var target = this.hash;
	  var $target = $j(target);

    $j('html, body').stop().animate({
      'scrollTop': $target.offset().top
    }, 900, 'swing');
  });

  $j('.navbar-collapse').on('show.bs.collapse', function() {
    $j('.header').addClass("header--open-nav");
  });

  $j('.navbar-collapse').on('hide.bs.collapse', function() {
    $j('.header').removeClass("header--open-nav");
  });


  $j('.js-select2').select2();

  drawPixels("#pixelsContainer");


    // Popup for pixels image
    $j('.buy-pixel__img').magnificPopup({
        type:'image',
        removalDelay: 500, //delay removal by X to allow out-animation
        callbacks: {
            beforeOpen: function() {
                // just a hack that adds mfp-anim class to markup
                this.st.image.markup = this.st.image.markup.replace('mfp-figure', 'mfp-figure mfp-with-anim');
                this.st.mainClass = this.st.el.attr('data-effect');
            },
            open: function() {
                $j(".mfp-figure  figure").html($j("#pixelsContainer").clone());
            }
        },
        closeOnContentClick: true
    });

});


function createTable(tableData) {
    var table = document.createElement('table');
    table.id = "pixelsGrid";
    var tableBody = document.createElement('tbody');

    tableData.forEach(function(rowData) {
        var row = document.createElement('tr');

        rowData.forEach(function(cellData) {
            var cell = document.createElement('td');
            cell.classList.add(cellData);
            row.appendChild(cell);
        });

        tableBody.appendChild(row);
    });

    table.appendChild(tableBody);
    return table;
}

// Create pixels over image
function drawPixels(item) {
    var percent = $j("#pixelsContainer").attr("data-percent");

    var pixels = numberArray.map(function(i) {
        return i.map(function(i) {
            if (i <= percent) {
                return "show";
            } else {
                return "hide";
            }
        })
    });

    $j(item).html(createTable(pixels));
}