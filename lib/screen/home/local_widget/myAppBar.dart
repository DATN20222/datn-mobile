import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class MyAppBar extends StatefulWidget{
  const MyAppBar({super.key});

  @override
  MyAppBarState createState() {
   return MyAppBarState();
  }

}
class MyAppBarState extends State<MyAppBar>{

  @override
  Widget build(BuildContext context) {
    return Container(

      child:Text("Hello")
    );
  }

}