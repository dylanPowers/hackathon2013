part of server;

class DBController {
  static final DBController _controller = new DBController._static();
  
  factory DBController() {
    return _controller;
  }
  
  DBController._static();
  
  List<ChatMessage> retrieveChatMessages() {
    
  }
  
  ChatMessage storeChatMessage(ChatMessage msg) {
    
  }
  
  User storeUser(User usr) {
    
  }
}