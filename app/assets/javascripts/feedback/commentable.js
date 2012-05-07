jQuery(document).ready(function($) {
  $('.reply-to-comment-btn').click(function(e) {
    var commentID = /reply-to-comment-(\d)-btn/.exec(this.id)[1], 
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
});
