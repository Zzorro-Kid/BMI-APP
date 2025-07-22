import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  CustomCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}