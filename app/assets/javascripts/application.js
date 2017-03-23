// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require bills
//= require cocoon
//= require global
//= require turbolinks
//= require_tree .



 $(document).on('ready turbolinks:load', function(){
    $('.datepicker').datepicker({
    	format: "mm-yyyy",
    viewMode: "months", 
    minViewMode: "months"
    })
    });
    




blinker = function() {
  $('.blink_me').fadeOut(100);
  $('.blink_me').fadeIn(500);
};

setInterval(blinker, 1000);


$(document).on('ready turbolinks:load', function(){
jQuery(function() {
  var typebill;
  typebill = $('#typebill-select').html();
  return $('#section-select').change(function() {
    var cat, options;
    cat = jQuery('#section-select').children('option').filter(':selected').text();
    options = $(typebill).filter("optgroup[label='" + cat + "']").html();
    if (options) {
      return $('#typebill-select').html(options);
    } else {
      return $('#typebill-select').empty();
    }
  });
});
});


$(document).on('ready turbolinks:load', function(){
jQuery(function() {
  var shelf;
  shelf = $('#shelf-select').html();
  return $('#rock-select').change(function() {
    var cat, options;
    cat = jQuery('#rock-select').children('option').filter(':selected').text();
    options = $(shelf).filter("optgroup[label='" + cat + "']").html();
    if (options) {
      return $('#shelf-select').html(options);
    } else {
      return $('#shelf-select').empty();
    }
  });
});
});