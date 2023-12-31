import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_web_app/main.dart';
import 'package:info_web_app/res/routes/app_route_constants.dart';
import 'package:info_web_app/screens/view_changer/desktop_view.dart';
import 'package:info_web_app/screens/error_page.dart';
import 'package:info_web_app/screens/home_feed.dart';
import 'package:info_web_app/screens/view_changer/mobile_view.dart';
import 'package:info_web_app/screens/view_changer/tab_view.dart';
import 'package:info_web_app/screens/userProfile_feed.dart';
import 'package:info_web_app/view_model/screen_size.dart';

class MyAppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
    GoRoute(
      path: "/",
      name: MyAppRouteConstants.loginRouteName,
      builder: (BuildContext context, GoRouterState state) {
        return const Responsive(  
        mobileScreen: MobilePage(),
        tabletScreen: TabletPage(),
        desktopScreen: DesktopPage(),
      );
      },
    ),


    GoRoute(
      name: MyAppRouteConstants.homeFeed,
      path: MyAppRouteConstants.homeFeed,
      builder: (BuildContext context, GoRouterState state) {
        return const FeedPage();
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.profile,
      path: MyAppRouteConstants.profile,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfilePage();
      },
    )
  ],
  errorBuilder: (BuildContext context, GoRouterState state) {
    return const ErrorPage();
  },
  );
}
