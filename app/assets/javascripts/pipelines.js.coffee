jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('li').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    
  $('#steps').sortable
    axis: 'y'
    handle: '.handle'
    update: ->
      $('#steps li > input:nth-child(3)').each (index, element) =>
        thisElement = $('#steps li > input:nth-child(3)').eq(index)
        thisElementName = 'pipeline[steps_attributes][' + index + ']'
        thisElement.attr('value',index+1)
        thisElement.attr('name', thisElementName + '[position]')
        thisElement.prev('input[type=text]').attr('name', thisElementName + '[name]')
        thisElement.prev('input[type=text]').prev('input[type=hidden]').attr('name', thisElementName + '[id]')
        thisElement.next('input[type=hidden]').attr('name', thisElementName + '[_destroy]')
