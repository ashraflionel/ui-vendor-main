import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_application_1/Handlers/Router.dart';
import 'Handlers/NavigationHandler.dart';
import 'Pages/home_page.dart';
import 'Pages/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     NavigationService.instance.pushNamedAndRemoveUntil(AppRoute.loginpage);
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFA000),
      ),
      onGenerateRoute: (settings) => AppRoute.generateRoute(settings),
      navigatorKey: NavigationService.instance.navigationKey,
      navigatorObservers: [NavigationService.instance.routeObserver],
    // home: FirebaseAuth.instance.currentUser != null ?const HomePage() :const LoginPage(),
     home: const HomePage(),
    );
  }
}
