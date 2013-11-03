part of small_talk;

class Session {
  static const String _SOCKET_ADDRESS = "localhost";
  static const int _SOCKET_PORT = 4000;
  
  Stream<ChatMessage> get chatMessages => _chatMessagesController.stream;
  
  Future get whenAuthenticated => _authComplete.future;
  
  var _authComplete = new Completer();
  var _chatMessagesController = new StreamController<ChatMessage>();
  WebSocket _socketConnection;
  
  static Session _userSession = new Session._static();
  
  factory Session() {
    return _userSession;
  }
  
  Session._static();
  
  Future<User> authenticate(User user) {
    user.id = 0;
    _authComplete.complete(user);
    return new Future.value(user);
  } 
  
  Future<ChatMessage> sendMessage(ChatMessage msg) {
    msg.id = 0;
    return new Future.value(msg);
  }
}