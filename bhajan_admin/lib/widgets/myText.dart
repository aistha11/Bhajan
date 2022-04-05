import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({ Key? key,required this.text }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
    );
  }
}