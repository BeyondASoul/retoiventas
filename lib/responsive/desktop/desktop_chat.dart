import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retoiventas/constants/colors.dart';

class DesktopChat extends StatelessWidget {
  const DesktopChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBlanquito,
      body: SingleChildScrollView(
        child: Row(
          children: [
            flexIzquierdo(mediaQuery),
            chatCentral(mediaQuery),
            flexDerecho(mediaQuery),
          ],
        ),
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
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset("lib/assets/lucia.png"),
                ),
              ),
            ),
            Text(
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
            Text(
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

  Text contentData(Size mediaQuery, String content) {
    return Text(
      content,
      textAlign: TextAlign.start,
      style: GoogleFonts.inter(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
    );
  }

  Padding titleData(Size mediaQuery, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: GoogleFonts.inter(
            fontSize: 16, color: Colors.black45, fontWeight: FontWeight.w300),
      ),
    );
  }

  Expanded chatCentral(Size mediaQuery) {
    return Expanded(
      flex: 8,
      child: Container(
        height: mediaQuery.height,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: colorVerde,
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: colorBlanquito,
                child: ListView(
                  children: [
                    Container(
                      height: 100,
                      color: Colors.black,
                    ),
                    Container(
                      height: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 100,
                      color: Colors.yellow,
                    ),
                    Container(
                      height: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: colorVerde,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded flexIzquierdo(Size mediaQuery) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        height: mediaQuery.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 80.0, 8.0, 40.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset("lib/assets/alejandro.png"),
                ),
              ),
            ),
            Text(
              "Alejandro García",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "55 2026 0240",
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
