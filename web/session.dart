part of small_talk;

class Session {
  static const String _SOCKET_ADDRESS = "localhost";
  static const int _SOCKET_PORT = 4000;
  
  Stream<ChatMessage> get chatMessages => _chatMessagesController.stream;
  String get name => _user.name;
  User get user => _user;
  Future get whenAuthenticated => _authComplete.future;
  
  Completer _authComplete = new Completer();
  StreamController _chatMessagesController = new StreamController<ChatMessage>();
  User _user;
  WebSocket _socketConnection;
  
  static Session _userSession = new Session._static();  
  factory Session() {
    return _userSession;
  }  
  Session._static();
  
  Future<User> authenticate(User user) {
    if (user.isValid) {
      user.id = 0;
      _user = user;
      _authComplete.complete(user);
      return new Future.value(user);
    }
    
    return new Future.error(user.invalidReason);
  } 
  
  Future<ChatMessage> sendMessage(ChatMessage msg) {
    msg.id = 0;
    _chatMessagesController.add(msg);
    return new Future.value(msg);
  }
}