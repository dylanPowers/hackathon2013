import 'dart:html';
import 'package:hackathon2013/user.dart';
import 'package:polymer/polymer.dart';

@CustomTag('chat-window-content')
class ChatWindowContent extends PolymerElement {
  
  var chatTextWindow;
  var inputTextWindow;
  var sendButton;
  
  User user;
  
  void inserted() {
    super.inserted();
    
    chatTextWindow = $['chatTextWindowId'];
    inputTextWindow = $['inputTextWindowId'];
    sendButton = $['sendButtonId'];
  }
  
  void send(MouseEvent e) {
    //SEND
    if(inputTextWindow.value != "") {
      chatTextWindow.value = chatTextWindow.value + inputTextWindow.value + "\n";
      inputTextWindow.value = "";
    }
  }
  
  void enter(KeyboardEvent e) {
    if(e.keyCode == KeyCode.ENTER) {
      sendButton.click();
    }
  }
}