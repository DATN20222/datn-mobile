import 'package:datn/screen/home/local_widget/myAppBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }

}
class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:PreferredSize(  preferredSize:  Size.fromHeight(40),
      child: MyAppBar(

      ),
    ));
  }

}