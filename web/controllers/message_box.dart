//import 'package:polymer/polymer.dart';

part of small_talk;

@CustomTag('message-box')
class MessageBox extends PolymerElement {
  @observable String boxText = 'Empty Message Box';
  @observable String cssClassProps = "right";
  
  get applyAuthorStyles => true;
  
  MessageBox.created() : super.created();
}