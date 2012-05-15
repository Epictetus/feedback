jQuery(document).ready(function($) {

  //control for comment reply button
  $('.reply-to-comment-btn').click(function(e) {
    var commentID = /reply-to-comment-(\d*)-btn/.exec(this.id)[1], 
    replyFormID = '#reply-to-comment-' + commentID + '-form', 
    replyButtonID = '#reply-to-comment-' + commentID + '-btn', 
    replyButtonTxt = $(replyButtonID).text(); 

    //toggle reply form
    $(replyFormID).slideToggle();

    //toggle reply button text
    replyButtonTxt = replyButtonTxt === 'Reply' ? 'Cancel Reply' : 'Reply';
    $(replyButtonID).text(replyButtonTxt);

    //prevent link from being followed
    e.preventDefault();
  });

  //control for comment list sort by select
  $('#sort_comments_by').change(function(e) {
    $(this).parents('form').submit();
  });

  var oTables = $('table.data-table').dataTable( {
    "sDom": "<'row'<'span2'l><'span4 toolbar'><'span6'f>r>t<'row'<'span6'i><'span6'p>>", 
    "sPaginationType": "bootstrap", 
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": ['no-sort'] }, 
      { "bSearchable": false, "aTargets": ['no-search'] }
    ]
  });

  $.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline", 
    "sSortAsc": "header headerSortDown",
    "sSortDesc": "header headerSortUp",
    "sSortable": "header"
  });

  // Add a select menu (for filtering) in each TH element in the table footer
  $('table.data-table').each(function () {
    var oTable = $(this).dataTable();
    oTable.find('tfoot th').each( function ( i ) {
      if($(this).hasClass('filterable')){
        this.innerHTML = Commentable.fnCreateSelect( oTable.fnGetColumnData(i) );
        $('select', this).change( function () {
          oTable.fnFilter( $(this).val(), i );
        });
      }
    });
  });
  
  // build the toolbar
  $('.tab-pane#default .toolbar').html(Commentable.toolbarContent());
  $('.tab-pane#deleted .toolbar').html('&nbsp;');
  
  //select all toggle
  $(".select-all-comments-toggle").change(function () {
    $(this).parents('table').find('input[name="selected_ids[]"]').attr("checked", this.checked);
  });
  
  //drill down
  $("table tr").click(function () {
    //var commentID = this.id.split('comment-row-')[1];
  });
  
});

Commentable = {
  fnCreateSelect: function ( aData ){
    var r = '<select><option value=""></option>', i, iLen = aData.length;
    for (i = 0; i < iLen; i++)
    {
      r += '<option value="' + aData[i] + '">' + aData[i] + '</option>';
    }
    return r + '</select>';
  }, 
  
  toolbarContent: function () {
    var content = '';
    content += '<div class="btn-group delete-comments">';
    content += '<button name="commit" value="destroy" type="submit" class="btn btn-danger" data-confirm="Really delete the selected comments?" data-method="delete"><i class="icon-trash icon-white"></i></a>';
    content += '</div>';
    return content;
  }
}