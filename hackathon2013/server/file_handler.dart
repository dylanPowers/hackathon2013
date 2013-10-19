part of server;


class FileHandler {
  String _basePath;
  
  FileHandler(Directory dir) {
    _basePath = "${dir.path}../web/";
  }
  
  void onRequest(HttpRequest request) {
    
    
  }  
}