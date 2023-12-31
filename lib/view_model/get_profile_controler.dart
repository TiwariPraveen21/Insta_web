import 'package:info_web_app/models/profile_model.dart';
import 'package:info_web_app/repository/home_repository.dart';

class UserProfileController{
   //get all data of specific user 
 final _myhomeRepo = HomeRepository();  
Stream<UserProfileModel?> getUserDetails(String userID){
  
  return _myhomeRepo.getUserData(id:userID );
}
}