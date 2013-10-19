library service_message;

import "package:json/json.dart" as json;

class ServiceMessage {
  static const num ACTION_NEW = 0;
  static const num ACTION_UPDATE = 1;
  
  num action;
  List items;
  
  String toJson() {
    var jsonStr = 'ServiceMessage : { ' +
        'action : ${json.stringify(action)},' +
        'items : ${json.stringify(items)}' +
        '}';
    return jsonStr;
  }
}