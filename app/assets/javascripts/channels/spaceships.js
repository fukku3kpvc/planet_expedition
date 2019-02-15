// App.expeditions = App.cable.subscriptions.create "ExpeditionsChannel",
//   connected: ->
//     # Called when the subscription is ready for use on the server
//
//   disconnected: ->
//     # Called when the subscription has been terminated by the server
//
//   received: (data) ->
//     # Called when there's incoming data on the websocket for this channel
App.cable.subscriptions.create("SpaceshipsChannel", {
    connected: function () {
        console.log('Hi spaceship');
    },
    received: function (data) {
        console.log(data);
        if (data['action'] === 'destroy') {
            let id = data['id'];
            $('#raw-'+ id).remove()
        }
        if (data['action'] === 'create') {
            $("tbody").append(data['partial'])
        }
    }
});