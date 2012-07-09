updatePipelineSteps = (steps) ->
  pipeline = $('#attempt_pipeline_id :selected').text()
  options = $(steps).filter("optgroup[label='#{pipeline}']").html()
  if options
    $('#attempt_statuses_attributes_0_step_id').html(options)
    $('#attempt_statuses_attributes_0_step_id').parent().show()
  else
    $('#attempt_statuses_attributes_0_step_id').empty()
    $('#attempt_statuses_attributes_0_step_id').parent().hide()

updateAttemptFields = (pipelines, steps) ->
  reagent_type = parseInt($('#isoform-search-reagent-type').attr('value'))
  if reagent_type != 0
    $('#attempt_pipeline_id').show()
    updatePipelineSteps(steps)
  else
    $('#attempt_pipeline_id').empty()
    $('#attempt_pipeline_id').hide()
    $('#attempt_statuses_attributes_0_step_id').empty()
    $('#attempt_statuses_attributes_0_step_id').parent().hide()

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('div.control-group').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('#attemptTime').datetimepicker({dateFormat: "yy-mm-dd", timeFormat: "hh:mm:ss"})

  $('#attempt_pipeline_id').hide()
  $('#attempt_statuses_attributes_0_step_id').parent().hide()
  pipelines = $('#attempt_pipeline_id').html()
  steps = $('#attempt_statuses_attributes_0_step_id').html()

  updateAttemptFields(pipelines, steps)
  $('#isoform-search-reagent-type').change -> updateAttemptFields(pipelines, steps)
  $('#attempt_pipeline_id').change -> updatePipelineSteps(steps)