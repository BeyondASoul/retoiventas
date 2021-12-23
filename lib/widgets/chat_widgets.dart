import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retoiventas/Model/message.dart';
import 'package:retoiventas/constants/colors.dart';
import 'package:retoiventas/screens/login.dart';
import 'package:retoiventas/utils/authentication.dart';
import 'package:retoiventas/utils/firebaseapi.dart';

Expanded chatBottomBar(TextEditingController chatController, String uid) {
  return Expanded(
    flex: 1,
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          children: [
            Expanded(
              flex: 10,
              child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 5.0),
                  child: TextField(
                    controller: chatController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hoverColor: Colors.white),
                  )),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: sendMessage(chatController, uid),
                child: const Icon(
                  CupertinoIcons.paperplane_fill,
                  color: colorBlanquito,
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    shape: const CircleBorder(),
                    primary: colorVerde,
                    onPrimary: colorBlanquito),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

sendMessage(TextEditingController chatController, String uid) {}

// sendMessage(TextEditingController controller, String message, String uid,
//     BuildContext context) async {
//   FocusScope.of(context).unfocus();
//   await FirebaseApi.uploadMessage(message, uid);
//   controller.clear();
// }

Expanded chatContentView(Size mediaQuery, String uid) {
  return Expanded(
    flex: 10,
    child: ListView.builder(
      itemCount: messages.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      itemBuilder: (context, index) {
        return Container(
          padding:
              const EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 5),
          child: Align(
            alignment: (messages[index].messageType != uid
                ? Alignment.centerLeft
                : Alignment.centerRight),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: (messages[index].messageType != uid
                    ? Colors.white
                    : colorVerdeChat),
              ),
              padding: const EdgeInsets.all(10),
              child: SelectableText(messages[index].messageContent,
                  textAlign: messages[index].messageType != uid
                      ? TextAlign.start
                      : TextAlign.end,
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.normal)),
            ),
          ),
        );
      },
    ),
  );
}

Expanded chatMobileTopBar(String asset, String name, BuildContext context) {
  return Expanded(
    flex: 1,
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          color: colorVerde,
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              avatar(asset),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    color: colorBlanquito,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Icon(CupertinoIcons.ellipsis_vertical),
                style: TextButton.styleFrom(
                    primary: colorBlanquito, onSurface: colorBlanquito),
              ),
              TextButton(
                onPressed: () async {
                  await signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: const Icon(CupertinoIcons.square_arrow_left),
                style: TextButton.styleFrom(
                    primary: colorBlanquito, onSurface: colorBlanquito),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Expanded chatDesktopTopBar(String asset, String name, BuildContext context) {
  return Expanded(
    flex: 1,
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          color: colorVerde,
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              avatar(asset),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: GoogleFonts.inter(
                    color: colorBlanquito,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              const Spacer(),
              TextButton(
                onPressed: () async {
                  await signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: const Icon(CupertinoIcons.square_arrow_left),
                style: TextButton.styleFrom(
                    primary: colorBlanquito, onSurface: colorBlanquito),
              )
            ],
          ),
        )
      ],
    ),
  );
}

AspectRatio avatar(String asset) {
  return AspectRatio(
    aspectRatio: 4 / 3,
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Image.asset(asset),
    ),
  );
}
