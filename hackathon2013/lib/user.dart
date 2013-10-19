library user;

class User {
  int id;
  String name;

  User.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
  }
  
  String toJson() {
    return "User : {" + 
        "id : $id," +
        "name : $name" + 
        "}";
  }
}