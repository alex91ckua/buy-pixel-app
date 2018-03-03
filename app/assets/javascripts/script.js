"use strict";

var $j = jQuery.noConflict();

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

  drawPixels("#pixelsContainer", 63, 38);

});

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) { arr2[i] = arr[i]; } return arr2; } else { return Array.from(arr); } }

function createArray(rows, cols) {
    return [].concat(_toConsumableArray(Array(rows).keys())).map(function (i) {
        return [].concat(_toConsumableArray(Array(cols).keys())).map(function (i) {
            return "hide";
        });
    });
}


function randomInteger(min, max) {
    var rand = min + Math.random() * (max - min)
    rand = Math.round(rand);
    return rand;
}


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
function drawPixels(item, cols, rows) {
    var x = cols;
    var y = rows;
    var pixelArray = createArray(38, 63);

    var percent = $j("#pixelsContainer").attr("data-percent");
    var totalCells = x * y;
    var visibleCells = Math.floor( (totalCells / 100) * percent);


    for (var i = 0; i < visibleCells;) {
        var randomRow = y-i;
        var randomCell = x-i;
        // console.log(randomRow);
        // console.log(randomCell);

        if (pixelArray[randomRow][randomCell] == "show") {
            continue;
        } else {
            pixelArray[randomRow][randomCell] = "show";
            i++;
        }
    }

    $j(item).html(createTable(pixelArray));
}