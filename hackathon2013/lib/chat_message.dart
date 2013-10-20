library chat_message;

import 'user.dart';

class ChatMessage {
  
  num ID;
  
  DateTime _sendTime;
  DateTime receiveTime;
  
  Duration _timeAlive;
  
  String _text;
  
  User _sender;
  
  ChatMessage(this._text, this._timeAlive, this._sender) {
    
  }
  
  ChatMessage.fromMap(Map map) {
    //TODO: Map to chatmessage stuff
  }
  
  String toJSON() {
    //TODO
    return "";
  }
}