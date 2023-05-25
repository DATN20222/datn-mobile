import 'package:datn/constants/colors.dart';
import 'package:datn/widgets/app_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }

}

class _LoginScreenState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset("assets/logo.png"),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AppTextField(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AppTextField(),
                ],
              ),
            ),
            ElevatedButton(onPressed: (){

              },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(15, 50),
              backgroundColor: AppColors.bgColorAppBar
            ), child: const Text("Login"),
            )
          ],
        ),
      )
    );
  }
}