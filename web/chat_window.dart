import 'dart:html';
import 'chat_window_content.dart';
import 'package:small_talk/user.dart';
import 'package:polymer/polymer.dart';
import 'package:small_talk/service_message.dart';

@CustomTag('chat-window')
class ChatWindow extends PolymerElement {
  
  String _SOCKET_ADDRESS = "localhost";
  int _SOCKET_PORT = 4000;
  
  var chatWindowContent;
  
  var text;
  var nameTextWindow;
  var submitButton;
  var divContainer;
  
  get applyAuthorStyles => true;
  
  ChatWindow.created() : super.created();
  
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
      content.webSocket = new WebSocket('ws://$_SOCKET_ADDRESS:$_SOCKET_PORT/');
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