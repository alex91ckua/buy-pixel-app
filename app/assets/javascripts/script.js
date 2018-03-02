"use strict";

var $j = jQuery.noConflict();

$j( document ).on('turbolinks:load', function() {

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

});
