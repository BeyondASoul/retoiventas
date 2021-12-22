import 'package:flutter/material.dart';
import 'package:retoiventas/responsive/desktop/desktop_body.dart';
import 'package:retoiventas/responsive/desktop/desktop_chat.dart';
import 'package:retoiventas/responsive/mobile/mobile_body.dart';
import 'package:retoiventas/responsive/mobile/mobile_chat.dart';
import 'package:retoiventas/responsive/responsive_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        // desktopBody: DesktopBody(),
        // mobileBody: MobileBody(),
        desktopBody: DesktopChat(),
        mobileBody: MobileChat(),
      ),
    );
  }
}
