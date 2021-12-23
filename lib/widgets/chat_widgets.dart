import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retoiventas/constants/colors.dart';
import 'package:retoiventas/screens/login.dart';
import 'package:retoiventas/utils/authentication.dart';
import 'package:retoiventas/utils/firebaseapi.dart';

SelectableText contentData(Size mediaQuery, String content) {
  return SelectableText(
    content,
    textAlign: TextAlign.start,
    style: GoogleFonts.inter(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
  );
}

Padding titleData(Size mediaQuery, String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0),
    child: SelectableText(
      title,
      textAlign: TextAlign.start,
      style: GoogleFonts.inter(
          fontSize: 16, color: Colors.black45, fontWeight: FontWeight.w300),
    ),
  );
}

Expanded chatBottomBar(
    TextEditingController chatController, String uid, BuildContext context) {
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
                    textInputAction: TextInputAction.go,
                    onSubmitted: (value) {
                      if (chatController.text.isNotEmpty) {
                        sendMessage(chatController, uid, context);
                      }
                    },
                    decoration: const InputDecoration(
                        label: Text(
                          "Escribe un mensaje...",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
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
                onPressed: () {
                  if (chatController.text.isNotEmpty) {
                    sendMessage(chatController, uid, context);
                  }
                },
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

sendMessage(TextEditingController chatController, String uid,
    BuildContext context) async {
  //FocusScope.of(context).unfocus();
  await FirebaseApi.uploadMessage(chatController.text, uid);
  chatController.clear();
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
              avatar(asset, 1),
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
              avatar(asset, 1),
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

AspectRatio avatar(String asset, double scale) {
  return AspectRatio(
    aspectRatio: 4 / 3,
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Image.asset(
        asset,
        scale: scale,
      ),
    ),
  );
}

class ChatContentView extends StatelessWidget {
  final Size mediaQuery;
  final String uid;
  const ChatContentView({Key? key, required this.mediaQuery, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc('messages')
          .collection('content')
          .orderBy('date', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            flex: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data!.docs[index];

                    return Container(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, top: 5, bottom: 5),
                      child: Align(
                        alignment: (doc['messageType'] != uid
                            ? Alignment.centerLeft
                            : Alignment.centerRight),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: (doc['messageType'] != uid
                                ? Colors.white
                                : colorVerdeChat),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: SelectableText(
                            doc['messageContent'],
                            textAlign: doc['messageType'] != uid
                                ? TextAlign.start
                                : TextAlign.end,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        } else {
          return const Expanded(
              flex: 10,
              child: Center(
                child: CircularProgressIndicator(),
              ));
        }
      },
    );
  }
}
