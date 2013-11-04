part of small_talk;

@CustomTag('chat-input')
class ChatInput extends PolymerElement {
  get applyAuthorStyles => true;
  
  String message = "";
  int timeOutSeconds = 30;
  
  Session _session = new Session();
  
  ChatInput.created() : super.created();
  
  void submit(Event e, var detail, var target) {
    e.preventDefault();
    
    var msg = new ChatMessage(message, new Duration(seconds: timeOutSeconds),
                              _session.user);
    _session.sendMessage(msg);
  }
}