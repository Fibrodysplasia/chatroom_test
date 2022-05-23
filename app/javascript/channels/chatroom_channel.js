import consumer from "./consumer"
import { scroll_to_bottom } from '../application.js'

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    console.log("Connected to Chatroom.");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    box = document.getElementById("chatroom-box");
    box.innerHTML += "<em class=\"ml-2 underline\">" + data.user.username + "</em>: " + data.body + "<br></br>";
  }
});
