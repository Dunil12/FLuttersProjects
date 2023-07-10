// построение виджета FirebaseStream
// StreamBuilder слушает изменения аутентификационного состояния пользователя
// через поток authStateChanges() из FirebaseAuth.instance

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/pages/home/home_page.dart';

class FirebaseStream extends StatelessWidget {
  const FirebaseStream({super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return snapshot.hasError
            ? const Scaffold(body: Center(child: Text('Что-то пошло не так!')))
            : (snapshot.hasData && !snapshot.data!.emailVerified)
                ? const HomePage() // было VerifyEmailPage()
                : const HomePage();
      });
}
