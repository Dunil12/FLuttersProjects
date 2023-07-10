import 'package:flutter/material.dart';
import 'package:gym/pages/auth/sign_in.dart';
import 'package:gym/pages/home/home_page.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return (user.uid != null) ? HomePage() : SignIn();
  }
}
