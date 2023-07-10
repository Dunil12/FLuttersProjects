import 'package:flutter/material.dart';
import 'package:gym/models/user.dart';
import 'package:gym/pages/auth/sign_up.dart';
import 'package:gym/services/firebase_auth/auth.dart';
import '../../dependency_injection/getit.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String error = "";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Sign in"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your email";
                    } else if (!value.contains('@')) {
                      return "Enter a valid email";
                    }
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your password";
                    } else if (value.length < 6) {
                      return "Password must be more than 6 characters long";
                    }
                    //return null;
                  },
                ),
                SizedBox(height: 20.0),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 15),),
                SizedBox(height: 10.0),
                ElevatedButton(
                  // стоит сделать его асинхронным
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;
                    
                    if (_formKey.currentState!.validate()) {
                      dynamic user = await getIt.get<AuthService>().signInWithEmailAndPassword(email, password);
                      if (user == null){
                        setState(() {
                          error = "Wrong email or password";
                        });
                        passwordController.clear();
                      }
                    }
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.button!.color,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    User user = await getIt.get<AuthService>().signInAnon();
                    user.showInfo();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  child: Text(
                    'Login Later',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.button!.color,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
