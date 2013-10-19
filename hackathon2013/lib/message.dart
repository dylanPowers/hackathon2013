library message;

import 'dart:core';
import 'user.dart';
import 'dart:convert';

class Message {
  
  num ID;
  
  DateTime _sendTime;
  DateTime receiveTime;
  
  Duration _timeAlive;
  
  String _text;
  
  User _sender;
  
  Message(this._text, this._timeAlive, this._sender) {
    
  }
  
  String toJSON() {
    return JSON.encode(this);
  }
}