// App.expeditions = App.cable.subscriptions.create "ExpeditionsChannel",
//   connected: ->
//     # Called when the subscription is ready for use on the server
//
//   disconnected: ->
//     # Called when the subscription has been terminated by the server
//
//   received: (data) ->
//     # Called when there's incoming data on the websocket for this channel
App.cable.subscriptions.create("ExpeditionsChannel", {
    connected: function () {
        console.log('Hi socket');
    },
    received: function (data) {
        console.log(data);
        if (data['action'] === 'create') {
            $(".expedition-list").append(data['partial'])
        }
        if (data['action'] === 'destroy') {
            let expedition_id = data['id'];
            $("#expedition_" + expedition_id).remove()
        }
    }
});