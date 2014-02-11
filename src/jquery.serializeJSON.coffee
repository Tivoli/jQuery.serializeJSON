do ($ = jQuery, window, document) ->
  $.fn.serializeJSON = ->
    json        = {}
    form        = $(this)
    form_array  = form.serializeArray()
    for field in form_array
      keys  = field.name.match(/\w+/g)
      root  = json
      el    = $("[name='#{field.name}']", form)
      true_value = el.val()
      if el.is('[type=checkbox]') and not true_value.length
        true_value = el.prop('checked')
      if el.is('[type=radio]')
        true_value = el.filter(':checked').val()
      while key = keys.shift()
        value = if keys.length then {} else true_value
        root = root[key] ?= value
    return json
