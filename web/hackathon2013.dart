import 'dart:html';

void main() {
  
  window.onSubmit.listen(stopRefresh);
  
}

void stopRefresh(Event e) {
  e.preventDefault();
}