part of common;


class ChatMessage {
  static const Duration DEFAULT_TIME_OUT = const Duration(days: 1);
  
  int id;
  
  bool get isAlive => new DateTime.now().compareTo(_sendTime.add(_timeAlive)) < 0;
  bool get isValid => _isTimeAliveValid && _isTextValid;
  
  String get invalidReason {
    String reason = "";
    if (!_isTimeAliveValid) {
      reason = "Time out period is invalid";
    } else if (!_isTextValid) {
      reason = "Text field is empty";
    }
    return reason;    
  }
  
  User get sender => _sender;
  String get text => _text;
  
  DateTime _receiveTime;
  User _sender;
  DateTime _sendTime;
  String _text;
  Duration _timeAlive;  

  bool get _isTimeAliveValid => _timeAlive != Duration.ZERO;
  bool get _isTextValid => _text.length > 0;
  
  
  ChatMessage(this._text, this._timeAlive, this._sender);
  
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