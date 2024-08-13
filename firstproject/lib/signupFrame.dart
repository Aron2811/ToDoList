import 'package:firstproject/frames/signedframe.dart';
import 'package:flutter/material.dart';

class Signupframe extends StatelessWidget {
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
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "ToDo List",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Signup")
      ],
    );
  }

  _inputField(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 100),
      child: Column(
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
          TextField(
            decoration: InputDecoration(
              hintText: "Confirm Password",
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
            onPressed: () {
              showDialog(
              context: context,
              builder: (context) => const CustomDialogWidget(),
            );
            },
            child: Text(
              "Signup",
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
      ),
    );
  }
}
