

import 'package:cloud_firestore/cloud_firestore.dart';

class PersonParameters{

  double weight;
  double height;
  int age;
  late double bodyMassIndex = weight / (height*height);

  PersonParameters({
    required this.weight,
    required this.height,
    required this.age,
  });

  List<> PersonParameters.fromFirestoreDatabase(QuerySnapshot querySnapshot){
    return Pers
  }

}