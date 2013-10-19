import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('input-window')
class InputWindow extends PolymerElement {
  
  var inputTextWindow;
  var sendButton;
  
  void inserted() {
    super.inserted();
    
    inputTextWindow = $['inputTextWindowId'];
    sendButton = $['sendButtonId'];
  }
  
  void setText(String s) {
    inputTextWindow.value = s;
  }
  
  String getText() {
    return inputTextWindow.value;
  }
}