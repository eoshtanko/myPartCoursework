import 'package:demoapp/myPages/registrationPages/age.dart';
import 'package:demoapp/myPages/registrationPages/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String name;
String surname;

class MyName extends StatelessWidget {
  final formKey = new GlobalKey<FormState>();
  final formKey1 = new GlobalKey<FormState>();
  BuildContext _context;

  void _submit() {
    final form = formKey.currentState;
    final form1 = formKey1.currentState;
    if (form.validate() && form1.validate()) {
      form.save();
      form1.save();
      _performLogin();
    }
  }

  void _performLogin() {
    hideKeyboard();
    Navigator.push(
        _context, new MaterialPageRoute(builder: (context) => new MyAge()));
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

  Widget _dataArea() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 153),
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
        _enterNameArea(),
        _enterSurnameArea(),
        enterButtonArea(_submit),
      ],
    ),
  );

  Widget _titleArea() => Container(
    margin: const EdgeInsets.only(left: 130, right: 130, top: 30),
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
      'Имя',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
    ),
  );

  Widget _enterNameArea() => Container(
    child: new Form(
      key: formKey,
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: new TextFormField(
              decoration: new InputDecoration(labelText: "Name",
                  helperText: "Введите Ваше имя"),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              keyboardType: TextInputType.name,
              maxLines: 1,
              autocorrect: false,
              onSaved: (val) => name = val,
              validator: (val) => (val.length < 3)
                  ? 'Not a valid name.'
                  : null,
            ),
            // todo too long
            width: 370.0,
          ),
          //enterButtonArea(),
        ],
      ),
    ),
  );

  Widget _enterSurnameArea() => Container(
    child: new Form(
      key: formKey1,
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: new TextFormField(
              decoration: new InputDecoration(labelText: "Surname",
                  helperText: "Введите Вашу фамилию"),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              keyboardType: TextInputType.name,
              maxLines: 1,
              autocorrect: false,
              onSaved: (val) => surname = val,
              validator: (val) => (val.length < 3)
                  ? 'Not a valid name.'
                  : null,
            ),
            // todo too long
            width: 370.0,
          ),
          //enterButtonArea(),
        ],
      ),
    ),
  );
}
