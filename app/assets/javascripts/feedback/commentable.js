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
  
  $('table#comment-list').dataTable( {
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>", 
    "sPaginationType": "bootstrap"
  });
  
  $.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
  });
  
  $.extend( $.fn.dataTableExt.oStdClasses, {
    "sSortAsc": "header headerSortDown",
    "sSortDesc": "header headerSortUp",
    "sSortable": "header"
  });
});
