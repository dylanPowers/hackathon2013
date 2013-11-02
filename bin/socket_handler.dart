part of server;

class SocketHandler {
  Map<WebSocket, User> _connections = new Map<WebSocket, User>();
  DBController _db = new DBController();
  
  void onConnection(WebSocket conn) {
    conn.listen((msg) {
      onMessage(msg, conn);
    });
  }
  
  void onMessage(String jsonMessage, WebSocket conn) {
    print("Socket message: $jsonMessage");
    var svcMsg = new ServiceMessage.fromJson(jsonMessage);
    if (svcMsg.action == ServiceMessage.ACTION_NEW) {
      svcMsg.items.forEach((item){
        if (item is User) {
          User user = _db.storeUser(item);
          _connections[conn] = user;
          conn.add(new ServiceMessage(ServiceMessage.ACTION_UPDATE, [user]).toJson());
          
          List msgs = _db.retrieveChatMessages();
          conn.add(new ServiceMessage(ServiceMessage.ACTION_NEW, msgs).toJson());
        } else if (item is ChatMessage) {
          var message = _db.storeChatMessage(item);
          _sendChatMessage(message);
        }
      });
    }
  }
  
  void _sendChatMessage(ChatMessage msg) {
    String svcMsg = new ServiceMessage(ServiceMessage.ACTION_NEW, [msg]).toJson();
    _connections.forEach((WebSocket conn, User usr) {
      if (usr != msg.sender) {
        conn.add(svcMsg);
      } else {
        conn.add(new ServiceMessage(ServiceMessage.ACTION_UPDATE, [msg]).toJson());
      }
    });
  }
}