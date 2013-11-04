part of small_talk;

@CustomTag('sign-in')
class SignInElement extends PolymerElement {
  get applyAuthorStyles => true;
  
  @observable
  String errorMsg = "";  
  @observable
  String name = "";
  
  Session _session = new Session(); 
  
  SignInElement.created() : super.created();
  
  void submit(Event e, detail, target) {
    e.preventDefault();
    _session.authenticate(new User(name)).catchError((e){
      errorMsg = e;
    }, test: (e) => e is String);
  }
}