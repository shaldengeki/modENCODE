/*
 * Function: fnGetHiddenTrNodes
 * Purpose:  Get all of the hidden TR nodes (i.e. the ones which aren't on display)
 * Returns:  array:
 * Inputs:   object:oSettings - DataTables settings object
 */
$.fn.dataTableExt.oApi.fnGetHiddenTrNodes = function ( oSettings )
{
    /* Note the use of a DataTables 'private' function thought the 'oApi' object */
    var anNodes = this.oApi._fnGetTrNodes( oSettings );
    var anDisplay = $('tbody tr', oSettings.nTable);

    /* Remove nodes which are being displayed */
    for ( var i=0 ; i<anDisplay.length ; i++ )
    {
        var iIndex = jQuery.inArray( anDisplay[i], anNodes );
        if ( iIndex != -1 )
        {
            anNodes.splice( iIndex, 1 );
        }
    }

    /* Fire back the array to the caller */
    return anNodes;
}

/* Init the table and fire off a call to get the hidden nodes. */
var oTable;
$(document).ready(function() {
    var oTable = $('#example').dataTable();

    $('#button').click( function () {
        var nHidden = oTable.fnGetHiddenTrNodes( );
        alert( nHidden.length +' nodes were returned' );
    } );
} );