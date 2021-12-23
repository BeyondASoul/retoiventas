import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retoiventas/constants/colors.dart';
import 'package:retoiventas/widgets/chat_widgets.dart';

class DesktopChat extends StatefulWidget {
  final String ownName, ownPhone, ownAsset, uid;
  const DesktopChat(
      {Key? key,
      required this.ownName,
      required this.ownPhone,
      required this.ownAsset,
      required this.uid})
      : super(key: key);

  @override
  State<DesktopChat> createState() => _DesktopChatState();
}

class _DesktopChatState extends State<DesktopChat> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final TextEditingController chatController = TextEditingController();
    return Scaffold(
      backgroundColor: colorBlanquito,
      body: Row(
        children: [
          flexIzquierdo(
              mediaQuery, widget.ownName, widget.ownPhone, widget.ownAsset),
          chatCentral(mediaQuery, widget.ownName, chatController, context),
          flexDerecho(mediaQuery),
        ],
      ),
    );
  }

  Expanded flexDerecho(Size mediaQuery) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        height: mediaQuery.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 80.0, 8.0, 40.0),
              child: avatar("lib/assets/lucia.png"),
            ),
            SelectableText(
              "Lucía González",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectableText(
              "55 2712 3617",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Editar datos",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    color: colorVerde,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
              child: Text(
                "Datos del contacto",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleData(mediaQuery, "Notas"),
                  contentData(mediaQuery, "Buen prospecto"),
                  titleData(mediaQuery, "Edad"),
                  contentData(mediaQuery, "38"),
                  titleData(mediaQuery, "Correo"),
                  contentData(mediaQuery, "lucia-test@gmail.com"),
                  titleData(mediaQuery, "Prioridad"),
                  contentData(mediaQuery, "Alta"),
                  titleData(mediaQuery, "Problema"),
                  contentData(mediaQuery, "Informes"),
                  titleData(mediaQuery, "Promoción"),
                  contentData(mediaQuery, "Cerrar venta en llamada"),
                  titleData(mediaQuery, "CURP"),
                  contentData(mediaQuery, "HGCT278371287319JCJ"),
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.1,
            )
          ],
        ),
      ),
    );
  }

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

  Expanded chatCentral(Size mediaQuery, String name,
      TextEditingController chatController, BuildContext context) {
    return Expanded(
      flex: 8,
      child: SizedBox(
        height: mediaQuery.height,
        child: Column(
          children: [
            chatDesktopTopBar(
                name == "Alejandro García"
                    ? "lib/assets/lucia.png"
                    : "lib/assets/alejandro.png",
                name == "Alejandro García"
                    ? "Lucía González"
                    : "Alejandro García",
                context),
            ChatContentView(
              mediaQuery: mediaQuery,
              uid: widget.uid,
            ),
            chatBottomBar(chatController, widget.uid, context),
          ],
        ),
      ),
    );
  }

  Expanded flexIzquierdo(Size mediaQuery, String name, phone, asset) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        height: mediaQuery.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 80.0, 8.0, 40.0),
              child: avatar(asset),
            ),
            SelectableText(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectableText(
              phone,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Stack(alignment: AlignmentDirectional.center, children: [
                Container(
                  height: 100,
                  color: colorVerdeClarito,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 35.0, right: 15.0),
                      child: Icon(
                        CupertinoIcons.chat_bubble_fill,
                        color: colorVerde,
                      ),
                    ),
                    Text(
                      "Chat",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
