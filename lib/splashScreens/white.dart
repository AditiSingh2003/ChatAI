import 'package:flutter/material.dart';

class white extends StatefulWidget {
  const white({super.key});

  @override
  State<white> createState() => _whiteState();
}

class _whiteState extends State<white> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: image.asset('assets/')
      ),
    );
  }
}