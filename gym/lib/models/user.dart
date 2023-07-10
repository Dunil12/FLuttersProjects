import 'package:firebase_auth/firebase_auth.dart' as FirebaseUser;

class User {
  //String? name;
  String? uid;

  User({
    //required this.name,
    required this.uid,
  });

  factory User.fromFirebaseUser(FirebaseUser.User? firebaseUser) {
    return User(uid: firebaseUser?.uid);
  }

  void showInfo() {
    print("Текущий пользователь $uid");
  }
}
