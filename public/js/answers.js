$(document).ready(function() {
  $('#add-answer').on('submit', function(event) {
    event.preventDefault();
    var answerText = $('#answer-text').val();
      if (answerText === "") {
        alert("Answer can not be blank")
        return false
      };

    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.ajax({
      url: url,
      data: data,
      method: 'POST'
    })
    .done(function(response){
      console.log(response);
      $('#answer-text').val("");
      $('#answers-list').append(response);
    });
  });
});
