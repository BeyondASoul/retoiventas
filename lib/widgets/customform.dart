// Widget general para crear textfields
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retoiventas/constants/colors.dart';

Padding customTextField(
    TextInputType tipoDeTeclado,
    Icon iconoIzquierda,
    String textoField,
    String contenidoField,
    TextEditingController controller,
    String? Function(String?)? funcion) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: TextFormField(
      controller: controller,
      obscureText: contenidoField == "password" ? true : false,
      style:
          GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold),
      autocorrect: false,
      keyboardType: tipoDeTeclado,
      decoration: InputDecoration(
        icon: iconoIzquierda,
        label: Text(
          textoField,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: funcion,
    ),
  );
}

InkWell botonLogin(String texto, Function() funcion) {
  return InkWell(
    borderRadius: BorderRadius.circular(30),
    onTap: funcion,
    child: Card(
      color: colorVerde,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 15.0, bottom: 15.0, left: 50.0, right: 50.0),
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
        ),
      ),
    ),
  );
}
