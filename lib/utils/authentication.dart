import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

String? uid;
String? userEmail;

// Future<User?> registerWithEmailPassword(String email, String password) async {
//   // Initialize Firebase
//   await Firebase.initializeApp();
//   User? user;

//   try {
//     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );

//     user = userCredential.user;

//     if (user != null) {
//       uid = user.uid;
//       userEmail = user.email;
//     }
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       print('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//       print('An account already exists for that email.');
//     }
//   } catch (e) {
//     print(e);
//   }

//   return user;
// }

Future<User?> signInWithEmailPassword(String email, String password) async {
  await Firebase.initializeApp();
  User? user;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;

    if (user != null) {
      uid = user.uid;
      userEmail = user.email;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('auth', true);
      await prefs.setString(
          'name',
          user.email == "alejandro@gmail.com"
              ? "Alejandro García"
              : "Lucía González");

      await prefs.setString(
          'phone',
          user.email == "alejandro@gmail.com"
              ? "55 2026 0240"
              : "55 2712 3617");

      await prefs.setString(
          'asset',
          user.email == "alejandro@gmail.com"
              ? "lib/assets/alejandro.png"
              : "lib/assets/lucia.png");

      await prefs.setString('uid', user.uid);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No se encontró ese usuario.');
    } else if (e.code == 'wrong-password') {
      print('La contraseña no coincide.');
    }
  }

  return user;
}

Future<String> signOut() async {
  await _auth.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);

  uid = null;
  userEmail = null;

  return 'User signed out';
}
