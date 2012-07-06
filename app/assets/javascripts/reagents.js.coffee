jQuery ->
  $('#reagent-search').dataTable
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
    "sPaginationType": "bootstrap"
    "oLanguage": {"sEmptyTable": "No reagents match your search query.", "sZeroRecords": "No reagents match your filter."}

searchReagentsWithIsoforms = () ->
  isoforms = []
  $(".isoform_checkbox:checked").each ->
    isoforms.push $(this).val()
  $("#statusTime").val (JSON.stringify isoforms)