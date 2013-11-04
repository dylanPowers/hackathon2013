part of small_talk;

@CustomTag('chat-feed')
class ChatFeed extends PolymerElement {
  get applyAuthorStyles => true;
  
  StreamSubscription<ChatMessage> _msgStream;
  Session _session = new Session();
  
  ChatFeed.created() : super.created() {
    _msgStream = _session.chatMessages.listen(onMessage);
  }
  
  void onMessage(ChatMessage msg) {
    var feed = $['chat-feed'];
    feed.children.add(new Element.tag('massage-box'));
//    var msgBox = new Element.tag('message-box');
//    MessageBox box = msgBox.xtag;
//    box.boxText = msg.text;
//    messageElements.add(box);
  }
}