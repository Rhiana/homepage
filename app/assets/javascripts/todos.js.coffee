#= require jquery

$ ->
  $('.todo-form').change (event) ->
    form = $(event.target).parents("form")
    request = $.ajax(
      url: form.attr('action')
      method: form.attr('method')
      data: form.serialize()
      dataType: "json"
    )
    request.then () ->
      console.log("then", arguments)
    request.success () ->
      console.log("success", arguments)
    request.error () ->
      console.log("error saving", arguments)
      alert("error saving: #{arguments}")
