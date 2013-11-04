part of small_talk;

@CustomTag('message-box')
class MessageBox extends PolymerElement {
  get applyAuthorStyles => true;
  
  @observable String boxText = 'Empty Message Box';
  @observable String cssClassProps = "right";  
  
  MessageBox.created() : super.created();
}