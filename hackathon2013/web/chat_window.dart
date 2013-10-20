import 'dart:html';
import 'chat_window_content.dart';
import 'package:hackathon2013/user.dart';
import 'package:polymer/polymer.dart';
import 'package:hackathon2013/service_message.dart';

@CustomTag('chat-window')
class ChatWindow extends PolymerElement {
  
  String _SOCKET_ADDRESS = "localhost";
  
  var chatWindowContent;
  
  var text;
  var nameTextWindow;
  var submitButton;
  var divContainer;
  
  get applyAuthorStyles => true;
  
  void inserted() {
    super.inserted();
    
    text = $['textId'];
    nameTextWindow = $['nameTextWindowId'];
    submitButton = $['submitButtonId'];
    divContainer = $['chat-window'];
  }
  
  void submit(MouseEvent e) {
    
    text.text = "Connecting to server...";
    
    chatWindowContent = createElement('chat-window-content');
    
    ChatWindowContent content = chatWindowContent.xtag;
    
    content.user = new User(nameTextWindow.value);

    try {
      content.webSocket = new WebSocket(_SOCKET_ADDRESS);
    } catch(e) {
      
    }
    
    if(content.webSocket == null || content.webSocket.readyState != WebSocket.OPEN) {
      text.text = "Error! Could not connect to server!";
      return;
    }
    
    ServiceMessage serviceMessage = new ServiceMessage(ServiceMessage.ACTION_NEW, [content.user]);
    
    content.webSocket.sendString(serviceMessage.toJson());
    
    divContainer.children.clear();
    
    divContainer.children.add(chatWindowContent);
  }
  
  void enter(KeyboardEvent e) {
    if(e.keyCode == KeyCode.ENTER) {
      submitButton.click();
    }
  }
}