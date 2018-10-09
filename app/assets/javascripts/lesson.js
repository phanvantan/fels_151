$(document).on("turbolinks:load", function() {
  var = 0
  nestedForm = $(".view-answers");
  formOnPage = $(".view-answers").length;
  $(nestedForm).find("input[type=radio_button]").each (function(){
    oldName = $(this).attr("name");
    newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[" + (formsOnPage + 1).toString() + "]");
    $(this).attr("name", newName);
  });
  $(".answer-area").append(nestedForm);
});
