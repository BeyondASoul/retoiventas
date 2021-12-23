import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retoiventas/screens/login.dart';

import 'package:retoiventas/utils/authentication.dart';
import 'package:retoiventas/widgets/customform.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: mediaQuery.height,
                    color: const Color(0xFFF3F4F8),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Image.asset(
                        "lib/assets/asset1.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Text(
                    "Iniciar sesión",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 32),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: mediaQuery.width < 1000
                        ? const EdgeInsets.all(60.0)
                        : const EdgeInsets.only(
                            top: 60.0, left: 120.0, right: 120.0, bottom: 60.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Textfield del correo electónico
                          customTextField(
                            TextInputType.emailAddress,
                            const Icon(CupertinoIcons.mail),
                            "Correo elecrónico",
                            "email",
                            _emailController,
                            (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                      .hasMatch(value)) {
                                return "Ingresa un correo válido";
                              } else {
                                return null;
                              }
                            },
                          ),
                          //Textfield de la constraseña
                          customTextField(
                            TextInputType.visiblePassword,
                            const Icon(CupertinoIcons.lock),
                            "Contraseña",
                            "password",
                            _passwordController,
                            (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                      .hasMatch(value)) {
                                return "Ingresa una contraseña válida";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: botonLogin(
                              "Iniciar sesión",
                              () async {
                                if (formKey.currentState!.validate()) {
                                  User? user = await signInWithEmailPassword(
                                      _emailController.text,
                                      _passwordController.text);
                                  if (user != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
