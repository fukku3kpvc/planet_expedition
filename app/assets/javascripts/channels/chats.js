// App.expeditions = App.cable.subscriptions.create "ExpeditionsChannel",
//   connected: ->
//     # Called when the subscription is ready for use on the server
//
//   disconnected: ->
//     # Called when the subscription has been terminated by the server
//
//   received: (data) ->
//     # Called when there's incoming data on the websocket for this channel
App.cable.subscriptions.create("ChatsChannel", {
    connected: function () {
        console.log('Chat Welcome');
    },
    received: function (data) {
        console.log(data);
        if (data['action'] === 'new_message') {
            $('.message-box').append('<div id="message">' + data['user'] + ': ' + data['message'] + '</div>');
        }
    }
});