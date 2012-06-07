jQuery ->
  $('#timepicker').datetimepicker()
  ###
  $('#attempt_pipeline_id').parent().hide()
  pipelines = $('#attempt_pipeline_id').html()
  $('#Reagent_name').change ->
    reagent_type = parseInt($('#attempt-reagent-type').attr('value'))
    options = $(pipelines).filter("optgroup[label='#{reagent_type}']").html()
    if options
      $('#attempt_pipeline_id').html(options)
      $('#attempt_pipeline_id').parent().show()
    else
      $('#attempt_pipeline_id').empty()
      $('#attempt_pipeline_id').parent().hide()
  ###