import 'dart:html';
import 'package:hackathon2013/user.dart';
import 'package:hackathon2013/chat_message.dart';
import 'package:polymer/polymer.dart';
import 'message_box.dart';

@CustomTag('chat-window-content')
class ChatWindowContent extends PolymerElement {
  
  var messageBox;
  
  var messageWindow;
  var inputTextWindow;
  var timeAliveWindow;
  var sendButton;
  
  User user;
  
  WebSocket webSocket;  
  get applyAuthorStyles => true;
  
  void inserted() {
    super.inserted();
    
    //webSocket.onMessage.listen(receiveFromServer);
    
    messageWindow = $['messageWindowId'];
    inputTextWindow = $['inputTextWindowId'];
    timeAliveWindow = $['timeAliveWindowId'];
    sendButton = $['sendButtonId'];
  }
  
  void send(MouseEvent e) {
    //SEND
    if(inputTextWindow.value != "") {
      
      messageBox = createElement('message-box');
      
      MessageBox box = messageBox.xtag;
      
      box.boxText = inputTextWindow.value;
      
      messageWindow.children.add(messageBox);
      
      ChatMessage message = new ChatMessage(inputTextWindow.value, new Duration(hours:0, minutes:0, seconds:int.parse(timeAliveWindow.value)), user);
      
      //webSocket.sendString(message.toJSON());
      
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