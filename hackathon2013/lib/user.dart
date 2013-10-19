library user;

import 'dart:convert';

class User {
  
  num userID;
  String name;
  
  User(this.name){
    
  }
  
  String toJson() {
    return JSON.encode(this);
  }
}