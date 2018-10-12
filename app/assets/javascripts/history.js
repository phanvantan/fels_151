  $(document).on("turbolinks:load", function(){
    $("#show_user_test").click(function(){
    if ($(".target").is(":hidden")) {
      $(".target").show();
    } else {
      $(".target").hide();
    }
    });
});
