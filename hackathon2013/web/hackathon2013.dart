import 'dart:html';
import 'package:polymer/polymer.dart';

var chatWindow1;
var inputWindow;
var sendButton;

var webSocket;

const String WEB_ADDRESS = "localhost";

void main() {
  
  chatWindow1 = query("#chatWindowId1");
  inputWindow = query("#inputWindowId");
  sendButton = query("#sendButtonId");
  
  //try {
    //webSocket = new WebSocket(WEB_ADDRESS);
  //} catch(e) {
    
  //}
    
  sendButton.onClick.listen(send);
  
  window.onSubmit.listen(enter);
}

void send(MouseEvent e) {
  if(inputWindow.value != "") {
    chatWindow1.value = chatWindow1.value + inputWindow.value + "\n";
    inputWindow.value = "";
  }
}

void enter(Event e) {
  e.preventDefault();
  sendButton.click();
}