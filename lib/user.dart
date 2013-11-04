part of common;

class User {
  int id;
  String name;

  String get invalidReason {
    if (!isValid) {
      return "Name cannot be empty";
    }
    
    throw new StateError("Bad call to invalid reason. User is valid");
  }
  
  bool get isValid {
    return name.length > 0;
  }  
  
  User(this.name);

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
  
  bool operator==(User rhs) => id == rhs.id;
}