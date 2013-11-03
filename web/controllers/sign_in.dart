//import 'dart:html';
//import '../chat_window_content.dart';
//import 'package:small_talk/user.dart';
//import 'package:polymer/polymer.dart';
//import 'package:small_talk/service_message.dart';

part of small_talk;

@CustomTag('sign-in')
class SignInElement extends PolymerElement {
//  
//  var chatWindowContent;
//  
//  var text;
//  var nameTextWindow;
//  var submitButton;
//  var divContainer;
  @observable
  String name = "";
  
  Session session = new Session();
  
  //get applyAuthorStyles => true;
  
  SignInElement.created() : super.created();
  
//  void inserted() {
//    super.inserted();
//    
//    text = $['textId'];
//    nameTextWindow = $['nameTextWindowId'];
//    submitButton = $['submitButtonId'];
//    divContainer = $['chat-window'];
//  }
  
  void submit(Event e, detail, target) {
    e.preventDefault();
    session.authenticate(new User(name));
  }
  
//  void enter(KeyboardEvent e) {
//    if(e.keyCode == KeyCode.ENTER) {
//      submitButton.click();
//    }
//  }
}