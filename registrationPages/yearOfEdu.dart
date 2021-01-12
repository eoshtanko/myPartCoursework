import 'package:demoapp/myPages/mainApp/mainAppMap.dart';
import 'package:demoapp/myPages/registrationPages/tools.dart';
import 'package:flutter/material.dart';
String building;

class MyYeasrOfEdu extends StatelessWidget {

  BuildContext _context;

  void _performLogin() {
    hideKeyboard();
    Navigator.push(
        _context, new MaterialPageRoute(builder: (context) => new MainApp()));
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
    margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 190),
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
        MyStageOfEdu(),
        enterButtonArea(_performLogin),
      ],
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
      'Курс',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
    ),
  );
}

class MyStageOfEdu extends StatefulWidget {
  @override
  _MyStageOfEduState createState() => _MyStageOfEduState();
}

class _MyStageOfEduState extends State<MyStageOfEdu> {
  String dropdownValue = 'Бакаклавриат 2 курс';
  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(top: 40, left: 35, right: 35),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 30,
            elevation: 16,
            style: TextStyle(color: Colors.black, fontSize: 20),
            underline: Container(),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>[
              'Бакаклавриат 1 курс',
              'Бакаклавриат 2 курс',
              'Бакаклавриат 3 курс',
              'Бакаклавриат 4 курс',
              'Бакаклавриат 5 курс',
              'Магистратура 1 курс',
              'Магистратура 2 курс',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )));
}

