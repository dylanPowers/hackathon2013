import 'dart:html';

var chatWindow1;
var inputWindow;
var sendButton;

var webSocket;

const String SOCKET_ADDRESS = "localhost";

void main() {
  
  window.onSubmit.listen(stopRefresh);
  
}

void stopRefresh(Event e) {
  e.preventDefault();
}