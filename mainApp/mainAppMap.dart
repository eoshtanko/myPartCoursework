import 'package:demoapp/myPages/mainApp/my_flutter_app_icons.dart';
import 'package:demoapp/myPages/mainApp/search.dart';
import 'package:flutter/material.dart';

/// This is the main application widget.
class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MyApp(),

    Text(
      'Текущие обмены',
    ),

    Text(
      'Мой профиль',
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded, size: 30,),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.handshake, size: 30,),
            label: 'Business',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30,),
            label: 'School',
          ),
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),

    );
  }
}

