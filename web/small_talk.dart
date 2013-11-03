library small_talk;

import 'dart:async';
import 'dart:html';
import 'package:polymer/polymer.dart';

import 'package:small_talk/common.dart';

part 'session.dart';
part 'controllers/chat_feed.dart';
part 'controllers/chat_input.dart';
part 'controllers/chat_window.dart';
part 'controllers/message_box.dart';
part 'controllers/sign_in.dart';

@CustomTag('small-talk')
class SmallTalk extends PolymerElement {
  
  bool get applyAuthorStyles => true;
  
  @observable
  bool showSignIn = true;
  Session session = new Session();
  
  SmallTalk.created() : super.created() {
    session.whenAuthenticated.then((_) {
      showSignIn = false;
    });
  }  
}