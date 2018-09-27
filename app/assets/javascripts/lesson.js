$( document ).ready(function() {
  $("#check_data").click(function(){
    $(".list-answers").find("input").each (function(){
      checkId = $(this).attr("id");
      $(checkId).change(function(){
        this.value = this.checked ? 1 : 0;
      }).change();
    });
  });
});
