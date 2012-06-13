updateStatusFields = (attempts, steps) ->
  reagent_id = parseInt($('#status-attempt-reagent-id').attr('value'))
  if reagent_id != 0
    options = $(attempts).filter("optgroup[label='#{reagent_id}']").html()
    if options
      $('#status_attempt_id').html(options)
      $('#status_attempt_id').show()
      attempt = $('#status_attempt_id :selected').text()
      options = $(steps).filter("optgroup[label='#{attempt}']").html()
      if options
        $('#status_step_id').html(options)
        $('#status_step_id').show()
        $('#status_description').parent().show()
      else
        $('#status_step_id').empty()
        $('#status_step_id').hide()
        $('#status_description').parent().hide()
    else
      $('#status_attempt_id').empty()
      $('#status_attempt_id').hide()
      $('#status_step_id').empty()
      $('#status_step_id').hide()
      $('#status_description').parent().hide()

jQuery ->
  $('#statusTime').datetimepicker({dateFormat: "yy-mm-dd", timeFormat: "hh:mm:ss"})
  $('#status_attempt_id').hide()
  $('#status_step_id').hide()
  $('#status_description').parent().hide()
  attempts = $('#status_attempt_id').html()
  steps = $('#status_step_id').html()

  updateStatusFields(attempts, steps)
  $('#status-attempt-reagent-id').change -> updateStatusFields(attempts, steps)