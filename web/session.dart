part of small_talk

class Session {
  static Session _userSession = new Session._static();
  
  factory Session() {
    return _userSession;
  }
  
  Session._static();
  
}