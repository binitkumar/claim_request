// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require rails-ujs
//= require jquery_nested_form
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
  $(":file").filestyle({input: false});
  $(":file").change(function(e){
    $(this).parent().find(".group-span-filestyle label").css("background", "gray");
    fileName = e.target.files[0].name;
    $(this).parent().find(".group-span-filestyle label span").html(fileName);
  });

  $(document).on('nested:fieldAdded', function(event){
    field = event.field;
    field.find(":file").filestyle({input: false});

    $(field).change(function(e){
      $(this).find(".group-span-filestyle label").css("background", "gray");
      fileName = e.target.files[0].name;
      $(this).find(".group-span-filestyle label span").html(fileName);
    });
  })
  $("a.add_nested_fields").click();
})
