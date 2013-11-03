//= require jquery

$(function() {
  $('.todo-form').change(function(event) {
    var form = $(event.target).parents("form");
    var request = $.ajax({
      url: form.attr('action'),
      method: form.attr('method'),
      data: form.serialize()
    });
  });
});

