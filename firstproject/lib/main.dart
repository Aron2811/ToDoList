import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/frames/signedframe.dart';
import 'package:firstproject/todoFrame.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/loginFrame.dart';
import 'frames/navBar.dart';
import 'package:firstproject/signupFrame.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginFrame(),
        routes: {
          '/LoginFrame': (context) => LoginFrame(),
          '/todoFrame': (context) => Todoframe(),
          '/navBar': (context) => NavBar(),
          '/signupFrame': (context) => Signupframe(),
          '/signedFrame': (context) => CustomDialogWidget(),
        });
  }
}
