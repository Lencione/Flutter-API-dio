import 'package:flutter/material.dart';
import 'package:splashscreen/pages/details_page.dart';
import 'package:splashscreen/pages/home_page.dart';
import 'package:splashscreen/pages/login_page.dart';
import 'package:splashscreen/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => SplashPage(),
        '/login': (_) => LoginPage(),
        '/homePage': (_) => HomePage(),
        '/details': (_) => DetailsPage(),
      },
    );
  }
}
