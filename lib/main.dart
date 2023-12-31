import 'package:flutter/material.dart';
import 'package:info_web_app/firebase_options.dart';
import 'package:info_web_app/res/provider/auth_forms.dart';
import 'package:info_web_app/res/provider/password_provider.dart';
import 'package:info_web_app/res/provider/selectImage_provider.dart';
import 'package:info_web_app/res/routes/app_route_config.dart';
import 'package:info_web_app/view_model/auth_view_model.dart';
import 'package:info_web_app/view_model/home_view_model.dart';
import 'package:info_web_app/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


GlobalKey<ScaffoldMessengerState> navigatorScaffoldKey = GlobalKey<ScaffoldMessengerState>();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => AuthFormProvider()),
        ChangeNotifierProvider(create:(_) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create:(_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => SelectImageProvider())
      ],
      child:MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        popupMenuTheme:const PopupMenuThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        dialogTheme:const DialogTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white
        )
       // useMaterial3: true,
      ),
     routeInformationParser: MyAppRouter.router.routeInformationParser,
     routerDelegate: MyAppRouter.router.routerDelegate,
     routeInformationProvider: MyAppRouter.router.routeInformationProvider,
     scaffoldMessengerKey: navigatorScaffoldKey,
    ),
      );
  }
}
