import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retoiventas/constants/colors.dart';
import 'package:retoiventas/screens/login.dart';
import 'package:retoiventas/utils/authentication.dart';
import 'package:retoiventas/widgets/chat_widgets.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

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
  late ScrollController scrollController;

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final TextEditingController chatController = TextEditingController();
    return Scaffold(
      backgroundColor: colorBlanquito,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
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
                          avatar(
                              widget.ownName == "Alejandro García"
                                  ? "lib/assets/lucia.png"
                                  : "lib/assets/alejandro.png",
                              1),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            widget.ownName == "Alejandro García"
                                ? "Lucía González"
                                : "Alejandro García",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                color: colorBlanquito,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              panelController.expand();
                            },
                            child: const Icon(CupertinoIcons.ellipsis_vertical),
                            style: TextButton.styleFrom(
                                primary: colorBlanquito,
                                onSurface: colorBlanquito),
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
                                primary: colorBlanquito,
                                onSurface: colorBlanquito),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ChatContentView(
                mediaQuery: mediaQuery,
                uid: widget.uid,
              ),
              chatBottomBar(chatController, widget.uid, context)
            ],
          ),
          Center(
            child: SlidingUpPanelWidget(
              child: Container(
                margin: const EdgeInsets.only(top: 150),
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        color: Color(0x11000000))
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: mediaQuery.width * 0.2,
                          child: Image.asset(
                            "lib/assets/lucia.png",
                          ),
                        ),
                      ),
                      SelectableText(
                        "Lucía González",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      SelectableText(
                        "55 2712 3617",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
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
                        width: mediaQuery.width,
                        height: mediaQuery.height * 0.1,
                      )
                    ],
                  ),
                ),
              ),
              controlHeight: 0.0,
              panelController: panelController,
              onTap: () {
                ///Customize the processing logic
                if (SlidingUpPanelStatus.expanded == panelController.status) {
                  panelController.collapse();
                } else {
                  panelController.expand();
                }
              }, //Pass a onTap callback to customize the processing logic when user click control bar.
              enableOnTap: true, //Enable the onTap callback for control bar.
              dragDown: (details) {
                print('dragDown');
              },
              dragStart: (details) {
                print('dragStart');
              },
              dragCancel: () {
                print('dragCancel');
              },
              dragUpdate: (details) {
                print(
                    'dragUpdate,${panelController.status == SlidingUpPanelStatus.dragging ? 'dragging' : ''}');
              },
              dragEnd: (details) {
                print('dragEnd');
              },
            ),
          ),
        ],
      ),
    );
  }
}
