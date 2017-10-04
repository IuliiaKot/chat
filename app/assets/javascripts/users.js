// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

  $('.start-conversation').on('click', function(e){
    e.preventDefault();

    let sender_id = $(this).data('sid');
    let recipient_id = $(this).data('rip');
    $.ajax({
      method: 'post',
      url: '/conversations',
      data: {sender_id: sender_id, recipient_id: recipient_id}
    }).done(function(res){
      
    })
  })
})
