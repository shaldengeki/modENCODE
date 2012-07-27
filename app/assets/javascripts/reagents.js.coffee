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

searchReagentsWithIsoforms = () ->
  isoforms = []
  $(".isoform_checkbox:checked").each ->
    isoforms.push $(this).val()
  $("#statusTime").val (JSON.stringify isoforms)