import 'package:flutter/material.dart';
import 'package:testproject/bloc/loginBloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

final bloc = LoginBloc();

class _LoginPageState extends State<LoginPage> {
  var con = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("build method rerun");
    con.text="";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
                flex: 5,
                child: ListView(
                  children: <Widget>[
                    StreamBuilder<String>(
                      stream: bloc.email,
                      builder: (context, snapshot) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextField(
                          key: Key("emailfield"),
                          controller: con,
                          onChanged: (String text) => bloc.onEmailChanged(text),
                          decoration: InputDecoration(
                              errorText: snapshot.error,
                              labelText: "email",
                              hasFloatingPlaceholder: true,
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    StreamBuilder<String>(
                      stream: bloc.password,
                      builder: (context, snapshot) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextField(
                          key: Key("passfield"),
                          onChanged: (String text) =>
                              bloc.onPasswordChanged(text),
                          obscureText: true,
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              labelText: "Password",
                              hasFloatingPlaceholder: true,
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    StreamBuilder(
                      stream: bloc.submit,
                      builder: (context, snapshot) => Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width / 3.5),
                        child: FlatButton(
                            splashColor: Colors.redAccent,
                            key: Key("LoginButton"),
                            color: Colors.grey[700],
                            onPressed: () {
                              snapshot.hasData
                                  ? bloc.checkLogin(context)
                                  : print("fix the error");
                            },
                            child: Text(
                              "Log in",
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}