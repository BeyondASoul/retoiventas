import 'package:flutter/material.dart';
import 'package:retoiventas/constants/colors.dart';
import 'package:retoiventas/widgets/chat_widgets.dart';

class MobileChat extends StatefulWidget {
  final String ownName, ownPhone, ownAsset, uid;
  const MobileChat(
      {Key? key,
      required this.ownName,
      required this.ownPhone,
      required this.ownAsset,
      required this.uid})
      : super(key: key);

  @override
  State<MobileChat> createState() => _MobileChatState();
}

class _MobileChatState extends State<MobileChat> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final TextEditingController chatController = TextEditingController();
    return Scaffold(
      backgroundColor: colorBlanquito,
      body: Column(
        children: [
          chatMobileTopBar(
              widget.ownName == "Alejandro García"
                  ? "lib/assets/lucia.png"
                  : "lib/assets/alejandro.png",
              widget.ownName == "Alejandro García"
                  ? "Lucía González"
                  : "Alejandro García",
              context),
          chatContentView(mediaQuery, widget.uid),
          chatBottomBar(chatController, widget.uid)
        ],
      ),
    );
  }
}
