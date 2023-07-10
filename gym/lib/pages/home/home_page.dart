import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym/dependency_injection/getit.dart';
import 'package:gym/services/firebase_auth/database.dart';
import 'package:provider/provider.dart';
import '../nav_drawer/nav_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    

    return StreamProvider<QuerySnapshot>.value(
      initialData: ,
      value: getIt.get<DatabaseService>().usersData,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Rostov Batya Fitness"),
            backgroundColor: Colors.blue,
          ),
          drawer: NavDrawer(),
          body: Text("")),
    ); 
  }
}
