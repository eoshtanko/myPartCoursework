import 'package:demoapp/myPages/registrationPages/password.dart';
import 'package:demoapp/myPages/registrationPages/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int keyFromEmail;

class MyKey extends StatelessWidget {
  final formKey = new GlobalKey<FormState>();

  BuildContext _context;

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _performLogin();
    }
  }

  void _performLogin() {
    hideKeyboard();
    Navigator.push(
        _context, new MaterialPageRoute(builder: (context) => new MyPassword()));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: BackButton(
          onPressed: () => Navigator.pop(context, false),
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
      ),

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
              _dataArea(),
              buildIm(),
            ],
          )),
    );
  }

  Widget _titleArea() => Container(
    // alignment: Alignment.bottomCenter,
    margin: const EdgeInsets.only(left: 60, right: 60, top: 30),
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 4,
          offset: Offset(1, 1),
        ),
      ],
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Text(
      'Код подтверждения',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
    ),
  );

  Widget _dataArea() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 200),
    padding: const EdgeInsets.only(bottom: 30),
    width: double.infinity,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 4,
          offset: Offset(1, 1),
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(10)),
      // BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(
      children: <Widget>[
        _titleArea(),
        _enterArea(),
        enterButtonArea(_submit),
      ],
    ),
  );

  Widget _enterArea() => Container(
    child: new Form(
      key: formKey,
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: new TextFormField(
              decoration: new InputDecoration(labelText: "Code from email",
                  helperText: "Введите код с почты"),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              keyboardType: TextInputType.number,
              maxLines: 1,
              onSaved: (val) => keyFromEmail = int.tryParse(val),
              validator: (val) => ((int.tryParse(val) == null) ||
                  int.tryParse(val) < 1 ||
                  int.tryParse(val) > 99)
                  ? 'Not a valid age.'
                  : null,
            ),
            width: 200.0,
          ),
        ],
      ),
    ),
  );
}
