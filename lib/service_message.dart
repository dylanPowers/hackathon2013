library service_message;

import "package:json/json.dart" as json;

import 'chat_message.dart';
import 'user.dart';

class ServiceMessage {
  static const int ACTION_NEW = 0;
  static const int ACTION_UPDATE = 1;
  
  int action;
  List items;
  
  ServiceMessage(this.action, this.items);
  
  ServiceMessage.fromJson(String jsonString) {
    var jsonMap = json.parse(jsonString, (key, value) {
      if (key == 'User') {
        return new User.fromMap(value);
      }
      else if (key == 'ChatMessage') {
        return new ChatMessage.fromMap(value);
      }
    });
    if (jsonMap is Map) {
      if (jsonMap.containsKey('ServiceMessage)')) {
        var messageMap = jsonMap['ServiceMessage'];
        if (messageMap is Map) {
          if (messageMap.containsKey('action')) {
            action = messageMap['action'];            
          }
          if (messageMap.containsKey('items')) {
            items = messageMap['items'];
          }
        }
      }
    }
  }
  
  String toJson() {
    var jsonStr = 'ServiceMessage : { ' +
        'action : ${json.stringify(action)},' +
        'items : ${json.stringify(items)}' +
        '}';
    return jsonStr;
  }
}