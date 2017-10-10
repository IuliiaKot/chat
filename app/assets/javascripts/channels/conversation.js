App.conversation = App.cable.subscriptions.create("ConversationChannel", {
  connected: function () {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function () {
    // Called when the subscription has been terminated by the server
  },

  received: function (data) {
    let conversation = $('#chat-history')
    conversation.find('.messages-list').find('ul').append(data['message']);

    let messagesList = conversation.find('.messages-list');
    let height = messagesList[0].scrollHeight;
    messagesList[0].scrollTop =  height;
    // window.scrollBy(0, 1000)
  },

  speak: function (message) {
    return this.perform('speak', {
      message: message
    });
  }
});

$(document).on('submit', '.new_message', function(e) {
  e.preventDefault();
  let values = $(this).serializeArray();
  App.conversation.speak(values);
  $(this).trigger('reset');
});
