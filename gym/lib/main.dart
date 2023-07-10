import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym/models/user.dart';
import 'package:gym/pages/auth/wrapper.dart';
import 'package:gym/services/firebase_auth/auth.dart';
import 'package:provider/provider.dart';
import 'dependency_injection/getit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // синхронизируем с firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // регестрируем зависимости в гетит
  registerDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) => StreamProvider<User>.value(
        initialData: getIt.get<User>(),
        value: getIt.get<AuthService>().user,
        child: MaterialApp(
          home: Wrapper(),
          theme: ThemeData.dark(),
        ),
      );
}
