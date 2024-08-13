import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBar createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  String? _displayName;
  String? _email;

  @override
  void initState() {
    super.initState();
    _fetchUserDisplayName();
    _fetchUserEmail();
  }

  Future<void> _fetchUserDisplayName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _displayName = user.displayName ?? "Username";
      });
    }
  }

  Future<void> _fetchUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _email = user.email ?? "Email not available";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              '$_displayName',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              '$_email',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: FirebaseAuth.instance.currentUser?.photoURL != null
                    ? Image.network(
                        FirebaseAuth.instance.currentUser!.photoURL!,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      )
                    : Icon(Icons.person, size: 50),
              ),
            ),
            decoration: BoxDecoration(
                color: Color(0xFF89ABE3),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://e1.pxfuel.com/desktop-wallpaper/190/790/desktop-wallpaper-1920x1080-anime-scenery-blue-aesthetic-landscape.jpg"),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Edit Profile"),
            onTap: () => print("priorities"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () => print("priorities"),
          ),
        ],
      ),
    );
  }
}
