import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:retoiventas/constants/colors.dart';
import 'package:retoiventas/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
        apiKey: "AIzaSyAoKBwFH96R_UKJVeQdY8sKC26ni4hc1LE",
        authDomain: "retoiventas.firebaseapp.com",
        projectId: "retoiventas",
        storageBucket: "retoiventas.appspot.com",
        messagingSenderId: "337556984247",
        appId: "1:337556984247:web:422b68452c651431bdd832"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reto iVentas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: colorVerde, primarySwatch: Colors.green),
      home: const LoginScreen(),
    );
  }
}
