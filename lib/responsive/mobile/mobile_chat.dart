import 'package:flutter/material.dart';

class MobileChat extends StatelessWidget {
  const MobileChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.green,
    );
  }
}
