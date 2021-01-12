import 'package:demoapp/myPages/registrationPages/tools.dart';
import 'package:demoapp/myPages/registrationPages/yearOfEdu.dart';
import 'package:flutter/material.dart';

String sex;

class MySex extends StatelessWidget {
  final formKey = new GlobalKey<FormState>();
  BuildContext _context;

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _performLogin();
    }
  }

  void _setMaleSex(){
    sex = 'Male';
    _submit();
  }

  void _setFemaleSex(){
    sex = 'Female';
    _submit();
  }

  void _performLogin() {
    Navigator.push(
        _context, new MaterialPageRoute(builder: (context) => new MyYeasrOfEdu()));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: BackButton(
          color: Colors.blue,
          onPressed: () => Navigator.pop(context, false),
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
    margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 209),
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
        _enterArea(),
      ],
    ),
  );

  Widget _enterArea() => Container(
    child: new Form(
      key: formKey,
      child: new Column(
        children: <Widget>[
          _titleArea(),
          _enterButtonAreaMale(),
          _enterButtonAreaFemale(),
        ],
      ),
    ),
  );

  Widget _titleArea() => Container(
    // alignment: Alignment.bottomCenter,
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
      'Пол',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
    ),
  );

  Widget _enterButtonAreaFemale() => MaterialButton(
    onPressed: _setFemaleSex,
    child: Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
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
        color: Colors.blue[100],
      ),
      child: Text(
        'Женский',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    ),
  );

  Widget _enterButtonAreaMale() => MaterialButton(
    onPressed: _setMaleSex,
    child: Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
      ),
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
        color: Colors.blue[100],
      ),
      child: Text(
        'Мужской',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    ),
  );
}
