import 'package:flutter/material.dart';
import 'package:retoiventas/responsive/desktop/desktop_chat.dart';
import 'package:retoiventas/responsive/mobile/mobile_chat.dart';
import 'package:retoiventas/responsive/responsive_layout.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        desktopBody: DesktopChat(),
        mobileBody: MobileChat(),
      ),
    );
  }
}
