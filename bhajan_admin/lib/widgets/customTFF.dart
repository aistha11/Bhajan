import 'package:flutter/material.dart';

class CustomTFF extends StatelessWidget {
  const CustomTFF({
    Key? key,
    required this.title,
    required this.field,
  }) : super(key: key);

  final String title;
  final Widget field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     title,
          //     style: TextStyle(
          //       fontWeight: FontWeight.w800,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: field,
          )
        ],
      ),
    );
  }
}