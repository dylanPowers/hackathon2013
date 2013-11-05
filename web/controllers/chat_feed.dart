part of small_talk;

@CustomTag('chat-feed')
class ChatFeed extends PolymerElement {
  get applyAuthorStyles => true;
  
  StreamSubscription<ChatMessage> _msgStream;
  Session _session = new Session();
  
  ObservableList<MessageBox> boxes = new ObservableList();
  
  ChatFeed.created() : super.created();
  
  @override
  void enteredView() {
    super.enteredView();
    _msgStream = _session.chatMessages.listen(onMessage);    
  }
  
  void onMessage(ChatMessage msg) {
    var feed = $['chat-feed'];
    MessageBox el = new Element.tag('message-box');
    el.boxText = msg.text;
    boxes.add(el);
    feed.children.add(el);
  }
}