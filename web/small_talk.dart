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
  
  // Until Dartium/Chromium/Chrome supports CSS editing of shadow dom objects
  // all HTML templates will use the global style sheet.
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