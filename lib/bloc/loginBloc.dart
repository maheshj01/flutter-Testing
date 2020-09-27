import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/bloc/validation.dart';
import 'package:testproject/pages/HomePage.dart';

class LoginBloc extends Validation {
  final _emailcontroller = BehaviorSubject<String>();
  final _passcontroller = BehaviorSubject<String>();

//validating the email
  Stream<String> get email => _emailcontroller.stream.transform(validate_email);

// validating the password
  Stream<String> get password =>
      _passcontroller.stream.transform(validate_pass);

  Stream<bool> get submit => Rx.combineLatest2(email, password, (e, p) => true);

  void onEmailChanged(String text) {
    _emailcontroller.sink.add(text);
  }

  void onPasswordChanged(String text) {
    _passcontroller.sink.add(text);
  }

  void checkLogin(BuildContext context) async {
    // print("email = ${_emailcontroller.value}\n password = ${_passcontroller.value}");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  void dispose() {
    _emailcontroller.close();
    _passcontroller.close();
    print("Stream cLOSED");
  }
}
