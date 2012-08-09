jQuery ->
  $('#reagent_group_user_tokens').tokenInput '/users.json'
    theme: 'facebook'
    prePopulate: $('#reagent_group_user_tokens').data('load')