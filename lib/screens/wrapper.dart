import 'package:conocetumente/screens/Authetication/authentication.dart';
import 'package:conocetumente/screens/Authetication/login.dart';
import 'package:conocetumente/screens/HomeScreens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final user = Provider.of(context);
    if(user != null){
      return HomeScreen();
    } else{
      return Authentication();
    }
  }
}