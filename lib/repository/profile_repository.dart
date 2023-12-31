import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:info_web_app/models/profile_model.dart';
import 'package:info_web_app/repository/home_repository.dart';

class ProfileRepository{
final storePostRef = FirebaseFirestore.instance.collection(FirebaseKey.postKey);
final storeUserRef = FirebaseFirestore.instance.collection(FirebaseKey.userKey);
//final _auth = FirebaseAuth.instance;

  Stream<UserProfileModel?> getCurrentUserProfile(String currentUserUID) {
  UserProfileModel? res;
  final fireStoreStream = storeUserRef.doc(currentUserUID).snapshots();
  return fireStoreStream.map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.exists)
    {
      final Map<String, dynamic> data = snapshot.data()!;
      res = UserProfileModel.fromJson(data);
    }
    return res;
  });
}

}