part of small_talk;

@CustomTag('chat-window')
class ChatWindowElement extends PolymerElement {
  get applyAuthorStyles => true;
  
//  var messageBox;
//  
//  var messageWindow;
//  var inputTextWindow;
//  var timeAliveWindow;
//  var sendButton;
//  
//  List<ChatMessage> chatMessageList = [];
  
//  User user;
  
//  WebSocket webSocket;  
  
  ChatWindowElement.created() : super.created();
  
//  void inserted() {
//    super.inserted();
//    
//    webSocket.onMessage.listen(receiveFromServer);
//    
//    messageWindow = $['messageWindowId'];
//    inputTextWindow = $['inputTextWindowId'];
//    timeAliveWindow = $['timeAliveWindowId'];
//    sendButton = $['sendButtonId'];
//  }
  
//  void send(MouseEvent e) {
//    if(inputTextWindow.value != "") {
//      
//      ChatMessage message = new ChatMessage(inputTextWindow.value, new Duration(hours:0, minutes:0, seconds:int.parse(timeAliveWindow.value)), user);
//      
//      chatMessageList.add(message);
//      
//      addMessageBox(message);
//      
//      webSocket.sendString(message.toJson());
//      
//      inputTextWindow.value = "";
//    }
//  }
//  
//  void enter(KeyboardEvent e) {
//    if(e.keyCode == KeyCode.ENTER) {
//      sendButton.click();
//    }
//  }
//  
//  void receiveFromServer(MessageEvent e) {
//    
//    var svcMsg = new ServiceMessage.fromJson(e.data);
//    if (svcMsg.action == ServiceMessage.ACTION_NEW) {
//      svcMsg.items.forEach((item){
//        if (item is User) {
//          User user = _db.storeUser(item);
//          _connections[conn] = user;
//          conn.add(new ServiceMessage(ServiceMessage.ACTION_UPDATE, [user]).toJson());
//          
//          List msgs = _db.retrieveChatMessages();
//          conn.add(new ServiceMessage(ServiceMessage.ACTION_NEW, msgs).toJson());
//        } else if (item is ChatMessage) {
//          var message = _db.storeChatMessage(item);
//          _sendChatMessage(message);
//        }
//      });
//    }
//    var message = new ServiceMessage.fromJson(e.data);
//    
//    
//    
//    chatMessageList.add(message);
//    
//    addMessageBox(message);
//    
//  }
//  
//  void addMessageBox(ChatMessage c) {
//    messageBox = createElement('message-box');
//    
//    MessageBox box = messageBox.xtag;
//    
//    box.boxText = c.text;
//    
//    if(c.sender.id != user.id) {
//      box.cssClassProps = "left";
//    }
//    
//    messageWindow.children.add(messageBox);
//  }
}