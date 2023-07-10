import 'package:flutter/material.dart';
import 'package:gym/services/firebase_auth/auth.dart';
import '../../dependency_injection/getit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // для валидации email & password
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Sign up"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Enter your email";
                    }
                    else if (!value.contains('@')){
                      return "Enter a valid email";
                    }
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Enter your password";
                    }
                    else if (value.length < 6){
                      return "Password must be more than 6 characters long";
                    }
                  },
                ),
                SizedBox(height: 20.0),                
                ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;
          
                    // проверяет валидаторы из TextFormField
                    if (_formKey.currentState!.validate()){
                      await getIt.get<AuthService>().registerWithEmailAndPassword(email, password);
                      Navigator.pop(context);
                    }
                    },
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
