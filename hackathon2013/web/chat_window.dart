import 'dart:html';
import 'chat_window_content.dart';
import 'package:hackathon2013/message.dart';
import 'package:hackathon2013/user.dart';
import 'package:polymer/polymer.dart';

@CustomTag('chat-window')
class ChatWindow extends PolymerElement {
  
  var chatWindowContent;
  
  var nameTextWindow;
  var submitButton;
  var divContainer;
  
  void inserted() {
    super.inserted();
    
    nameTextWindow = $['nameTextWindowId'];
    submitButton = $['submitButtonId'];
    divContainer = $['divContainerId'];
  }
  
  void submit(MouseEvent e) {
    
    
    
    // Need to submit user name to server and get server ID
    
    chatWindowContent = createElement('chat-window-content');
    
    ChatWindowContent content = chatWindowContent.xtag;
    
    content.user = new User(nameTextWindow.value);
    
    divContainer.children.clear();
    
    divContainer.children.add(chatWindowContent);
  }
  
  void enter(KeyboardEvent e) {
    if(e.keyCode == KeyCode.ENTER) {
      submitButton.click();
    }
  }
}