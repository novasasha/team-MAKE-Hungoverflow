$(document).ready(function() {
  $(".vote-form").on("submit", function(event) {
    event.preventDefault();
    $form = $(this)
    var method = $form.attr("method");
    var url = $form.attr("action")
    var data = $form.serialize();
    var $ajaxRequest = $.ajax( {
      method: method,
      url: url,
      data: data
    });
    $ajaxRequest.done(function(response) {
      console.log(response);
      var $voteCounts = $form.parent().find(".vote-counts")
      $voteCounts.text("Total Votes: " + response);
    });
    $ajaxRequest.fail(function(response) {
      alert(response.responseText);
    })

  })
});
