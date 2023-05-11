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
    return AppBar(
      toolbarHeight: 50,
      centerTitle: true,
      backgroundColor: AppColors.bgColorAppBar,
      title: const Text(
        "Monitor students",
        style: TextStyle(
          color: AppColors.appYellow
        ),
      ),
    );
  }

}