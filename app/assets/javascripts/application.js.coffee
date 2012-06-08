$(".deselectRadioButton").click((e) ->
  if $(this).hasClass("on")
    $(this).removeAttr "checked"
    $(this).removeClass "on"
  else
    $(this).addClass "on"
    $(".deselectRadioButton").not(this).removeClass "on"
).filter(":checked").addClass "on"