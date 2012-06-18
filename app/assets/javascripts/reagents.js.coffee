searchReagentsWithIsoforms = () ->
  isoforms = []
  $(".isoform_checkbox:checked").each ->
    isoforms.push $(this).val()
  $("#statusTime").val (JSON.stringify isoforms)