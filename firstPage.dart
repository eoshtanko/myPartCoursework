import 'package:demoapp/myPages/mainApp/mainAppMap.dart';
import 'package:demoapp/myPages/registrationPages/email.dart';
import 'package:demoapp/myPages/registrationPages/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatelessWidget {
  String _email;
  String _password;

  final formKey = new GlobalKey<FormState>();
  BuildContext _context;

  void submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      performLogin();
    }
  }

  void performLogin() {
    hideKeyboard();
    Navigator.push(
        _context, new MaterialPageRoute(builder: (context) => new MainApp()));
  }

  void performReg() {
    Navigator.push(
        _context, new MaterialPageRoute(builder: (context) => new MyEmail()));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            image: DecorationImage(
              image: AssetImage('assets/images/фон.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              _buildTopIm(),
              _enterArea(),
              _enterButtonArea(),
              _registButtonArea(),
            ],
          )),
    );
  }

  Widget _enterButtonArea() => Container(
        margin: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 20,
        ),
        child: MaterialButton(
          onPressed: submit,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Text(
              'Вход',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );

  Widget _registButtonArea() => Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 20),
        child: MaterialButton(
          onPressed: performReg,
          child: Container(
              // alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Text(
                'Регистрация',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              )),
        ),
      );

  Widget _enterArea() => Container(
        child: new Form(
          key: formKey,
          child: new Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: new TextFormField(
                  decoration: new InputDecoration(labelText: "Email",   helperText: "Введите @edu.hse.ru почту"),
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  onSaved: (val) => _email = val,
                  validator: (val) =>
                      !val.contains("@") ? 'Not a valid email.' : null,

                ),
                width: 400.0,
              ),
              new Container(
                child: new TextFormField(
                  decoration: new InputDecoration(labelText: "Password",
                  helperText: "Введите пароль"),
                  obscureText: true,
                  maxLines: 1,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  validator: (val) =>
                      val.length < 6 ? 'Not a valid password.' : null,
                  onSaved: (val) => _password = val,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                width: 400.0,
                //padding: new EdgeInsets.only(top: 38.0),
              ),
            ],
          ),
        ),
      );

  Widget _buildTopIm() => Container(
        margin: const EdgeInsets.only(top: 120, bottom: 15),
        child: Image.asset(
          'assets/images/11.png',
        ),
      );
}
