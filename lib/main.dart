import 'package:flutter/material.dart';
import 'LoginBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final bloc = LoginBloc();

class _MyHomePageState extends State<MyHomePage> {
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
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                          color: Colors.redAccent,
                          onPressed: () {
                            setState(() {
                              // con.text="hello";
                              print("button pressed" + con.text);
                            });
                          },
                          child: Text(
                            "On Press Rebuild entire UI",
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
