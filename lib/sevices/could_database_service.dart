import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doggo/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CloudDatabaseService{
  FirebaseFirestore instance = FirebaseFirestore.instance;

  Future<UserModel> getUser() async {
    var data = await instance.collection('Users').where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    UserModel user = UserModel.fromJson(data.docs.first.data());
    return user;
  }

  Future<dynamic> getData({ required String collection, String? field, String? fieldData}) async {
      final data = instance.collection(collection).where(field!, isEqualTo: fieldData).get();
      var date = data.then((value) {
      });
  }

  Future<dynamic> create(dynamic data, {required String collection}) async {
    instance.collection(collection).add(data);
}
}