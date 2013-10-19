import 'dart:html';

var chatWindow1;
var inputWindow;
var sendButton;

var webSocket;

const String SOCKET_ADDRESS = "localhost";

void main() {
  
  window.onSubmit.listen(stopRefresh);
  
  try {
    webSocket = new WebSocket(SOCKET_ADDRESS);
  } catch(e) {
    
  }
  
}

void stopRefresh(Event e) {
  e.preventDefault();
}