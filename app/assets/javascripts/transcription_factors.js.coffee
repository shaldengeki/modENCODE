jQuery ->
  $('#gene_select_table').dataTable
    sPaginationType: "bootstrap"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#gene_select_table').data('source')