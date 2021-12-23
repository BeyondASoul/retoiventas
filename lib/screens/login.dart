import 'package:flutter/material.dart';
import 'package:retoiventas/responsive/desktop/desktop_body.dart';
import 'package:retoiventas/responsive/desktop/desktop_chat.dart';
import 'package:retoiventas/responsive/mobile/mobile_body.dart';
import 'package:retoiventas/responsive/mobile/mobile_chat.dart';
import 'package:retoiventas/responsive/responsive_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool authState = false;
  String name = "", phone = "", asset = "", uid = "";

  @override
  void initState() {
    super.initState();
    getAuthStatus();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name") ?? "";
      phone = prefs.getString("phone") ?? "";
      asset = prefs.getString("asset") ?? "";
      uid = prefs.getString("uid") ?? "";
    });
  }

  void getAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      authState = prefs.getBool("auth") ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: authState
          ? ResponsiveLayout(
              desktopBody: DesktopChat(
                ownName: name,
                ownPhone: phone,
                ownAsset: asset,
                uid: uid,
              ),
              mobileBody: MobileChat(
                ownName: name,
                ownPhone: phone,
                ownAsset: asset,
                uid: uid,
              ),
            )
          : const ResponsiveLayout(
              desktopBody: DesktopBody(),
              mobileBody: MobileBody(),
            ),
    );
  }
}
