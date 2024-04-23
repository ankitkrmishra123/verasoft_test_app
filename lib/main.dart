import 'package:flutter/material.dart';
import 'package:verasoft_test/screens/Authentication/LoginPage.dart';
import 'package:verasoft_test/screens/CommonWidgets/loading_with_transparent_background.dart';
import 'package:verasoft_test/screens/HomePage.dart';
import 'package:verasoft_test/screens/Profile/CountPage.dart';
import 'package:verasoft_test/screens/Profile/ProfilePage.dart';

late String authId;
void main() {
  authId = "some_id";
  runApp(const MyApp());
}

final routes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/loadingSpinkit': (context) => const SpinKitThreeBounceLoading(),
  '/profile': (context) => const ProfileScreen(),
  '/count_screen': (context) => const CountScreen(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: authId == "" ? '/login' : '/',
      routes: routes,
      title: 'Kiri Service',
      //navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
