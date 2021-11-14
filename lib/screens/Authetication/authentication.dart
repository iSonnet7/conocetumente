import 'package:conocetumente/screens/Authetication/login.dart';
import 'package:conocetumente/screens/Authetication/register.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToggle = false;
  void toggleScreen() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isToggle) {
      return Register(toggleScreen: toggleScreen);
    } else {
      return Login(toggleScreen:toggleScreen);
    }
  }
}
