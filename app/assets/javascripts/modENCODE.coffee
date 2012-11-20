$(".deselectRadioButton").click((e) ->
  if $(this).hasClass("on")
    $(this).removeAttr "checked"
    $(this).removeClass "on"
  else
    $(this).addClass "on"
    $(".deselectRadioButton").not(this).removeClass "on"
).filter(":checked").addClass "on"

jQuery ->
  $('.dataTable').each ->
    thisDataTable = $(this).dataTable
      "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
      "sPaginationType": "bootstrap"
      "oLanguage": {"sEmptyTable": "No records were found.", "sZeroRecords": "No records match your filter."}
    $(".dataTable-form").each ->
      $(this).submit ->
        $(thisDataTable.fnGetHiddenTrNodes()).find("input").filter ->
          this.value.length != 0;
        .appendTo this
        return
      return
    return
  return