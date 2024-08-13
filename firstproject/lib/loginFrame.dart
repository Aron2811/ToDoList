import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/signupFrame.dart';
import 'package:firstproject/todoFrame.dart';
import 'package:firstproject/utils/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

String taskName = '';
bool taskCompleted = false;
Function(bool?)? onChanged;
Function(BuildContext)? deleteFunction;

class LoginFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFCADCFC),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgetPassword(context),
              _signup(context),
              _googleLogin(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          "ToDo List",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Login")
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person)),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.key),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
            shadowColor: Colors.black,
            elevation: 5,
          ),
        )
      ],
    );
  }

  _forgetPassword(context) {
    return TextButton(onPressed: () {}, child: Text("Forgot password?"));
  }

  Widget _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont have an account?"),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signupFrame');
          },
          child: Text("Sign Up"),
        )
      ],
    );
  }

  _googleLogin(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            signInWithGoogle(context);
          },
          child: Image.asset(
            'assets/google.png',
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 8),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            "Login with Google!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

Route<dynamic> _createRoute(TodoList todoList) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Todoframe(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    // Sign out the current user
    await GoogleSignIn().signOut();
    print('User signed out');

    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    // Sign in with Google
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      print('Google Sign-In was cancelled.');
      return; // The user canceled the sign-in
    }
    print('Google user signed in: ${googleUser.email}');

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    if (googleAuth.accessToken == null && googleAuth.idToken == null) {
      print('Error: accessToken and idToken are both null.');
      return; // Neither token is available, cannot proceed
    }
    print('Google authentication tokens received');

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print('Firebase user signed in with Google credentials');

    User? user = userCredential.user;
    if (user != null) {
      // Store user information in Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'displayName': user.displayName,
        'email': user.email,
        'photoURL': user.photoURL,
        'lastSignInTime': user.metadata.lastSignInTime,
      }, SetOptions(merge: true));

      // Add a subcollection 'todos' for the user
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('todos')
          .add({
        'taskName': taskName,
        'taskCompleted': taskCompleted,
      });

      Navigator.of(context).pop();
      // Navigate to UserLoggedInPage upon successful sign-in
      Navigator.push(
          context,
          _createRoute(TodoList(
              taskName: taskName,
              taskCompleted: taskCompleted,
              onChanged: onChanged,
              deleteFunction: deleteFunction)));

      print('Navigated to UserLoggedInPage');
    } else {
      print('Error: Firebase user is null');
    }

    print('User displayName: ${user?.displayName}');
  } catch (e) {
    print("Error during Google sign-in: $e");
  }
}
