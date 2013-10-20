library chat_message;

import "package:json/json.dart" as json;

import 'user.dart';

class ChatMessage {
  
  int id;
  
  DateTime _sendTime;
  
  Duration _timeAlive;
  
  String _text;
  String get text => _text;
  
  User _sender;
  User get sender => _sender;
  
  bool get isAlive => new DateTime.now().compareTo(_sendTime.add(_timeAlive)) < 0;
  
  
  ChatMessage(this._text, this._timeAlive, this._sender) {
    
  }
  
  ChatMessage.fromMap(Map map) {
    //TODO: Map to chatmessage stuff
    _text = map['text'];
    _timeAlive = new Duration(microseconds: map['timeAlive']);
    _sender = new User.fromMap(map['sender']);
    _sendTime = new DateTime.fromMillisecondsSinceEpoch(map['sendTime']);
  }
  
  String toJson() {
    var jsonStr = 'ChatMessage : { ' +
        'sender : ${json.stringify(_sender)},' +
        'sendTime : ${json.stringify(_sendTime.millisecondsSinceEpoch)},' +
        'timeAlive : ${json.stringify(_timeAlive.inMicroseconds)}' +
        'text : ${json.stringify(_text)}' +
        '}';
    return jsonStr;
  }
  
  bool operator==(ChatMessage rhs) => id == rhs.id;
}