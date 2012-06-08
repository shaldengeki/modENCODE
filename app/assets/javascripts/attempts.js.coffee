updateAttemptFields = (pipelines, steps) ->
  reagent_type = parseInt($('#attempt-reagent-type').attr('value'))
  if reagent_type != 0
    options = $(pipelines).filter("optgroup[label='#{reagent_type}']").html()
    if options
      $('#attempt_pipeline_id').html(options)
      $('#attempt_pipeline_id').parent().show()
    else
      $('#attempt_pipeline_id').empty()
      $('#attempt_pipeline_id').parent().hide()
    pipeline = $('#attempt_pipeline_id :selected').text()
    options = $(steps).filter("optgroup[label='#{pipeline}']").html()
    if options
      $('#attempt_statuses_attributes_0_step_id').html(options)
      $('#attempt_statuses_attributes_0_step_id').parent().show()
    else
      $('#attempt_statuses_attributes_0_step_id').empty()
      $('#attempt_statuses_attributes_0_step_id').parent().hide()

jQuery ->
  $('#timepicker').datetimepicker()

  $('#attempt_pipeline_id').parent().hide()
  $('#attempt_statuses_attributes_0_step_id').parent().hide()
  pipelines = $('#attempt_pipeline_id').html()
  steps = $('#attempt_statuses_attributes_0_step_id').html()

  updateAttemptFields(pipelines, steps)
  $('#attempt-reagent-type').change -> updateAttemptFields(pipelines, steps)
