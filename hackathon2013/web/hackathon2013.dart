import 'dart:html';
import 'package:polymer/polymer.dart';

var chatWindow;
var inputWindow;
var sendButton;

var webSocket;

const String WEB_ADDRESS = "localhost";

void main() {
  
  //chatWindow = query("#chatWindowId");
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
    chatWindow.value = chatWindow.value + inputWindow.value + "\n";
    inputWindow.value = "";
  }
}

void enter(Event e) {
  e.preventDefault();
  sendButton.click();
}