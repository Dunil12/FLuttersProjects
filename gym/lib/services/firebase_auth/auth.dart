import 'package:firebase_auth/firebase_auth.dart' as FirebaseUser;
import 'package:flutter/cupertino.dart';
import 'package:gym/dependency_injection/getit.dart';
import 'package:gym/models/user.dart';
import 'package:gym/services/firebase_auth/database.dart';

class AuthService extends ChangeNotifier {
  final _auth = FirebaseUser.FirebaseAuth.instance;
  // FirebaseUser.User? firebaseUser;

  // проверка на то залогинен или нет
  //bool isLogged() => (_firebaseUser != null) ? true : false;

  // надо или нет хз
  // AuthService() {
  //   _auth.authStateChanges().listen((firebaseUser_) {
  //     firebaseUser = firebaseUser_;
  //   });
  // }

  // геттер текущего пользователя
  FirebaseUser.User? get currentUser => _auth.currentUser;

  // поток user ов
  Stream<User> get user {
    return _auth.authStateChanges().map((firebaseUser) => User.fromFirebaseUser(firebaseUser));
  }

  // sign in as Anonimous
  Future signInAnon() async {
    try {
      final result = await _auth.signInAnonymously();
      final firebaseUser = result.user;
      getIt.get<User>().uid = firebaseUser?.uid;
    } catch (e) {
      print(e.toString()); 
    }
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final firebaseUser = result.user;
      // здесь должна быть функция которая определяет все поля (не null) User
      getIt.get<User>().uid = firebaseUser?.uid;
    } catch (e) {
      print(e.toString());
    }
  }

  // register
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final firebaseUser = result.user;
      notifyListeners();
      // меняем состояние uid у синглтона
      getIt.get<User>().uid = firebaseUser?.uid;
      // добавим коллекцию в cloud firestore
      await getIt.get<DatabaseService>().updateUserData("new user", 0, 0, 0, 0);
    } 
    catch (e) {
      print(e.toString());
    }
  }

  //sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      getIt.get<User>().uid = null;
      
      //getIt.reset;
      //registerDependencies();

    } catch (e) {
      print(e.toString());
    }
  }
}
