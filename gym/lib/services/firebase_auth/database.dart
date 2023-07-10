import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym/dependency_injection/getit.dart';
import 'package:gym/models/person_parameters.dart';
import 'package:gym/models/user.dart';

class DatabaseService {
  final CollectionReference collection = FirebaseFirestore.instance.collection('Users');

  Future updateUserData(
      String name, double height, double weight, int age, double bodyMassIndex) async {
    return await collection.doc(getIt.get<User>().uid).set({
      "name": name,
      "height": height,
      "weight": weight,
      "age": age,
      "bodyMassIndex": bodyMassIndex,
    });
  }

  // Stream<QuerySnapshot> get usersData{
  //   return collection.snapshots();
  // }

  Stream<List<PersonParameters>> personParametersStream (QuerySnapshot querySnapshot) {
    return collection.snapshots().map(() => );
  } 
}
