import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:info_web_app/models/profile_model.dart';
import 'package:info_web_app/repository/profile_repository.dart';

class ProfileViewModel with ChangeNotifier{
  final _auth = FirebaseAuth.instance;
  final _profileRepo = ProfileRepository();

  Stream<UserProfileModel?> getUserDetails(){
   return  _profileRepo.getCurrentUserProfile(_auth.currentUser!.uid);
    
  }
}