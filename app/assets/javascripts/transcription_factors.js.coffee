jQuery ->
	thisDataTable = 
	  $('#gene_select_table').dataTable
	    sPaginationType: "bootstrap"
	    bJQueryUI: true
	    bProcessing: true
	    bServerSide: true
	    iDisplayLength: 25
	    sAjaxSource: $('#gene_select_table').data('source')
	$(".dataTable-form").each ->
	  $(this).submit ->
	    $(thisDataTable.fnGetHiddenTrNodes()).find("input").filter ->
	      this.value.length != 0;
	    .appendTo this
	    return
	  return
	return