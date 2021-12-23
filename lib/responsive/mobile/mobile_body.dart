import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retoiventas/screens/login.dart';

import 'package:retoiventas/utils/authentication.dart';
import 'package:retoiventas/widgets/customform.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.asset(
                  "lib/assets/asset1.png",
                  scale: 5,
                ),
              ),
            ),
            Text(
              "Iniciar sesión",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 28),
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
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
                                    builder: (context) => const LoginScreen()),
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
      ),
    );
  }
}
