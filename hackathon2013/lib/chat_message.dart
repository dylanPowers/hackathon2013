library chat_message;

import 'user.dart';

class ChatMessage {
  
  int id;
  
  DateTime _sendTime;
  DateTime receiveTime;
  
  Duration _timeAlive;
  
  String _text;
  
  User _sender;
  User get sender => _sender;
  
  bool get isAlive => new DateTime.now().compareTo(receiveTime.add(_timeAlive)) < 0;
  
  
  ChatMessage(this._text, this._timeAlive, this._sender) {
    
  }
  
  ChatMessage.fromMap(Map map) {
    //TODO: Map to chatmessage stuff
  }
  
  String toJSON() {
    //TODO
    return "";
  }
  
  bool operator==(ChatMessage rhs) => id == rhs.id;
}