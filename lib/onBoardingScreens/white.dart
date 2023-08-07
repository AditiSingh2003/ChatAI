import 'package:flutter/material.dart';
import 'package:chatai/onBoardingScreens/splashScreen.dart';

class white extends StatefulWidget {
  const white({super.key});

  @override
  State<white> createState() => _whiteState();
}

class _whiteState extends State<white>
  with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SplashScreen(),
        ),
      );
    });
  }
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/chat_bot_com.png')
      ),
    );
  }
}