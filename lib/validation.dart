import 'dart:async';

class Validation {
  var validate_email =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    RegExp regex = new RegExp("""^[a-zA-Z]{3,}[0-9]*@[a-z]{3,}.com\$""");
    if (regex.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError("Email should be in abc@xyz.com format");
    }
  });

  var validate_pass = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    RegExp regex = new RegExp("[#@_0-9]");
    if (regex.hasMatch(password)) {
      sink.add(password);
    } else {
      sink.addError("Password must contain [#/*/_]");
    }
  });
}
