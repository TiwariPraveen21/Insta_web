import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_web_app/repository/home_repository.dart';
import 'package:info_web_app/res/custom_widget/home/home_style.dart';
import 'package:info_web_app/res/routes/app_route_constants.dart';
import 'package:info_web_app/utils/utils.dart';
import 'package:info_web_app/view_model/auth_view_model.dart';
import 'package:info_web_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class CostumAppBar extends StatelessWidget{
  const CostumAppBar({super.key});

 @override

 Widget build(BuildContext context) {
   final _myhomeRepo = HomeRepository();
   final provider = Provider.of<HomeViewModel>(context);
   final _auth = Provider.of<FirebaseAuthProvider>(context);
   Size size = MediaQuery.of(context).size;
     final searchController = TextEditingController();
   return   Container(
     decoration: const BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.only(
         bottomLeft: Radius.circular(10),
         bottomRight: Radius.circular(10),
       ),
     ),
     padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
     child: Row(
       children: [
         // Logo of the company
         Image.asset(
           'assets/image/info_logo.png',
           width: size.width * 0.13,
           fit: BoxFit.fill,
         ),

         SizedBox(width: size.width * 0.05),

         // Home icon
         InkWell(
           onTap: () {},
           child: Container(
             padding: const EdgeInsets.all(5),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(7),
               border: Border.all(
                 color: Colors.black.withOpacity(0.2),
                 width: 1,
               ),
             ),
             child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Image.asset('assets/image/home.png', fit: BoxFit.fill,
                   height: 20,
                   width: 20,),
                 const SizedBox(width: 5),
                 const Text(
                     'Home', style: TextStyle(fontSize: 14, color: Colors
                     .blue, fontWeight: FontWeight.w900)),
               ],
             ),
           ),
         ),

         // List icons
         InkWell(
             onTap: () {},
             child: Image.asset(
               'assets/image/frame.png', fit: BoxFit.fill,
               height: 55,
               width: 55,)
         ),

         SizedBox(width: size.width * 0.2,),

         // Search bar
         Expanded(
           child: TextFormField(
            controller: searchController ,
             decoration: InputDecoration(
               contentPadding: const EdgeInsets.symmetric(
                   vertical: 0, horizontal: 10),
               border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: BorderSide(color: Colors.grey.shade200)
               ),
               focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: BorderSide(
                       color: Colors.grey.shade200, width: 2)
               ),
               disabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: BorderSide(
                       color: Colors.grey.shade200, width: 2)
               ),
               prefixIcon: InkWell(
                onTap: () async{

                String name = searchController.text.toString().trim();

                //List<UserProfileModel>? users =  await provider.getUserAllUserExcepMe(name);

                 provider.searchAllUseAPI(name).then((value) {
                   Utils.showUserSearchDialog(context, value!, _myhomeRepo.followUser);
                   //name ="";
                 });
                },
                 child: Icon(
                     Icons.search, color: Colors.grey.shade200),
               ),
             ),
           ),
         ),

         SizedBox(width: size.width * 0.01,),

         // Notification icon
         InkWell(
             onTap: () {
               showDialog(
                 context: context,
                 builder: (context) {
                   return AlertDialog(
                     content: const Text('Notification Dialog'),
                     actions: [
                       TextButton(
                         onPressed: () {
                           Navigator.pop(context);
                         },
                         child: const Text('OK'),
                       ),
                     ],
                   );
                 },
               );
             },
             child: Image.asset(
               'assets/image/notification.png', fit: BoxFit.fill,
               height: 20,
               width: 20,)
         ),

         SizedBox(width: size.width * 0.01,),

         // Profile of user
         PopupMenuButton<int>(
           itemBuilder: (context) => [

             PopupMenuItem<int>(
               value: 1,
               child: Text('Home', style: AppStyle.popUpconnectionTextName),
               onTap: (){
                 context.goNamed(MyAppRouteConstants.homeFeed);
               },
             ),
             const PopupMenuDivider(),
             PopupMenuItem<int>(
               value: 2,
               child: Text('Personal Profile', style: AppStyle.popUpconnectionTextName),
               onTap: (){
                 context.goNamed(MyAppRouteConstants.profile);
               },
             ),
             const PopupMenuDivider(),
             PopupMenuItem<int>(
               value: 3,
               child: Text('LogOut', style: AppStyle.popUpconnectionTextName),
               onTap: () async{
                await _auth.logout(() {
                   context.goNamed(MyAppRouteConstants.loginRouteName); 
                 }).then((value){
                  debugPrint("LogOut successfully$value");
                 });
               },
             ),
           ],
           offset: const Offset(0, 50),
           elevation: 2,
           onSelected: (value) {
             if (value == 1) {
               print('Button 1');
             } else if (value == 2) {
               print('Button 2');
             } else if (value == 3) {
               print('Button 3');
             }
           },
           child:const CircleAvatar(
             backgroundColor: Colors.blue,
           ),
         )

       ],
     ),
   );
 }

}

