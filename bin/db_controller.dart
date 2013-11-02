part of server;

class DBController {
  static final DBController _controller = new DBController._static();
  
  List<ChatMessage> messages;
  List<User> users;
  
  factory DBController() {
    return _controller;
  }
  
  DBController._static();
  
  List<ChatMessage> retrieveChatMessages() {
    return messages.takeWhile((msg) => msg.isAlive);
  }
  
  ChatMessage storeChatMessage(ChatMessage msg) {
    messages.add(msg);
    msg.id = messages.length - 1;
    return msg;
  }
  
  User storeUser(User usr) {
    users.add(usr);
    usr.id = users.length - 1;
    return usr;
  }
}