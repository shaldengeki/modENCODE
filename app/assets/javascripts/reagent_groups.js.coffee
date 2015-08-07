filterGeneList = (geneType) ->
  $('#gene_select_table_filter input').val geneType
  $('#gene_select_table_filter input').trigger 'keyup'
  event.preventDefault()


displayGeneSelectionField = (val) ->
  $('.gene_input:visible').each ->
    $(this).hide()
  $('#gene_' + val).fadeIn()
  event.preventDefault()

jQuery ->
  $('.autofill_tokens').each ->
    $(this).tokenInput '/modENCODE/users.json'
      theme: 'facebook'
      prePopulate: $('#reagent_group_user_tokens').data('load')
  $('.workflow_input_method').each ->
    $(this).click ->
      displayGeneSelectionField $(this).val()
  $('#reagent_group_gene_type_id').change ->
    filterGeneList $("#reagent_group_gene_type_id option:selected").text()

  $('.reagent_checkbox').each () ->
    $(this).click () ->
      reagents = []
      $('.reagent_checkbox:checked').each () ->
        reagents.push $(this).val()
        return
      $('input[name=reagent_ids]').val JSON.stringify(reagents)
      $('input[name=reagent_ids]').trigger 'change'