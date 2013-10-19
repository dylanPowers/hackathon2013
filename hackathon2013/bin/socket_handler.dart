part of server;

class SocketHandler {
  Map<WebSocket, User> _connections = new Map<WebSocket, User>();
  
  void onConnection(WebSocket conn) {
    
  }
  
  void onMessage(String jsonMessage, WebSocket conn) {
    
  }
}