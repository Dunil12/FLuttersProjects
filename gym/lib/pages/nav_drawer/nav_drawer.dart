import 'package:flutter/material.dart';
import 'package:gym/dependency_injection/getit.dart';
import 'package:gym/models/user.dart';
import 'package:gym/pages/home/home_page.dart';
import 'package:gym/services/firebase_auth/auth.dart';

import '../settings_page/settings_page.dart';
import '../../prew/trainer_list_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 52,
                  //backgroundImage: NetworkImage(""),
                  backgroundColor: Colors.black,
                ),
                SizedBox(height: 12),
                Text(
                  "Danil",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                Text(
                  "@gmail.com",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Профиль', style: TextStyle(fontSize: 18)),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Выбор тренера', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TrainerListScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Выйти', style: TextStyle(fontSize: 18)),
              onTap: () {
                getIt.get<AuthService>().signOut();
              }),
        ],
      ),
    );
  }
}
