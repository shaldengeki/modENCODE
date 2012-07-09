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

  $('#reagent-search').dataTable
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
    "sPaginationType": "bootstrap"
    "oLanguage": {"sEmptyTable": "No reagents match your search query.", "sZeroRecords": "No reagents match your filter."}

searchReagentsWithIsoforms = () ->
  isoforms = []
  $(".isoform_checkbox:checked").each ->
    isoforms.push $(this).val()
  $("#statusTime").val (JSON.stringify isoforms)