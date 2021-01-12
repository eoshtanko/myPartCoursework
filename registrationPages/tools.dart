import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildIm() => Flexible(child:  Container(
  alignment: Alignment.bottomLeft,
  child: Image.asset(
    'assets/images/22.png',
  ),
),);

Widget enterButtonArea(void submit()) => MaterialButton(
  onPressed: submit,
  child: Container(
    margin: const EdgeInsets.only(
      left: 20,
      right: 20,
      top: 40,
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
      'Дальше',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    ),
  ),
);

void hideKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}