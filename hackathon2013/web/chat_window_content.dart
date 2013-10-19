import 'dart:html';
import 'package:hackathon2013/user.dart';
import 'package:polymer/polymer.dart';

@CustomTag('chat-window-content')
class ChatWindowContent extends PolymerElement {
  
  var chatTextWindow;
  var inputTextWindow;
  var sendButton;
  
  User user;
  
  WebSocket webSocket;
  
  void inserted() {
    super.inserted();
    
    //webSocket.onMessage.listen(receiveFromServer);
    
    chatTextWindow = $['chatTextWindowId'];
    inputTextWindow = $['inputTextWindowId'];
    sendButton = $['sendButtonId'];
  }
  
  void send(MouseEvent e) {
    //SEND
    if(inputTextWindow.value != "") {
      
      //Message message = new Message()
      
      inputTextWindow.value = "";
    }
  }
  
  void enter(KeyboardEvent e) {
    if(e.keyCode == KeyCode.ENTER) {
      sendButton.click();
    }
  }
  
  void receiveFromServer(MessageEvent e) {
    
  }
}