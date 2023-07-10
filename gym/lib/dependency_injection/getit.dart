import 'package:get_it/get_it.dart';
import 'package:gym/models/user.dart';
import 'package:gym/services/firebase_auth/auth.dart';
import 'package:gym/services/firebase_auth/database.dart';

// здесь разместим гетит

final getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<User>(User.fromFirebaseUser(getIt.get<AuthService>().currentUser));
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
}
