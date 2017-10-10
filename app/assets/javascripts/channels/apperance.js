let buttonSelector;

App.apperance = App.cable.subscriptions.create("ApperanceChannel", {
  connected: function () {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function () {
    // Called when the subscription has been terminated by the server
  },

  received: function (data) {
    let currentUser = $('.list').attr('data-current');
    let userList = $('#people-list').find('.list');
    let res = [];
    data.appearances.forEach(function(user){
      if (user.id != currentUser){
        let link = "<a class='btn btn-success btn-xs start-conversation' href='#' data-sid=" + currentUser + " data-rip=" + user.id + ">Send Message</a>";
        let elm = "<li class='clearfix'><div class='about'>" +
            "<div class='name'><a href='/'>" + user.username + "</a>" +
              link +
            "</div><div class='status'>"+
              (user.online ? "<i class='fa fa-circle online'></i> online" : "<i class='fa fa-circle offline'></i> offline")+
            "</div></div></li>"
        res.push(elm);
      }
    })
    userList.html(res);
  }
});
