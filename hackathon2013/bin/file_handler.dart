part of server;

class FileHandler {
  final String _basePath;
  
  FileHandler(Directory dir) : 
      _basePath = pathOS.join(dir.absolute.path, "../web");
  
  void _send404(HttpResponse response) {
    response.statusCode = HttpStatus.NOT_FOUND;
    response.close();
  }
  
  void onRequest(HttpRequest request) {
    String path = request.uri.path;
    if (request.uri.path == '/') {
      path = '/hackathon2013.html';
    }
    path = pathOS.normalize(path);

    print("Http request for $path");
    
    final File file = new File('${pathOS.join(_basePath, path)}');
    file.exists().then((bool found) {
      if (found) {
        if (!file.absolute.path.startsWith(_basePath)) {
          _send404(request.response);
        } else {
          file.openRead().pipe(request.response).catchError((error) {
            print("Error reading the file ${file.absolute.path}: $error");
          });
        }
      } else {
        _send404(request.response);
      }
    }).catchError((error){
      _send404(request.response);
    });    
  }  
}