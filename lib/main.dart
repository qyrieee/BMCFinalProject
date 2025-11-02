

import 'package:flutter/material.dart';

// 1. Import the Firebase core package
import 'package:firebase_core/firebase_core.dart';
// 2. Import the auto-generated Firebase options file
import 'firebase_options.dart';
//3. Import the flutter_native_splash
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:ecommerce_app/screens/signup_screen.dart';



void main() async {
  // 1. Preserve the splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 2. Initialize Firebase (from Module 1)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 3. Run the app (from Module 1)
  runApp(const MyApp());

  // 4. Remove the splash screen after app is ready
  FlutterNativeSplash.remove();
}




  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  // 1. MaterialApp is the root of your app
  return MaterialApp(
  // 2. This removes the "Debug" banner
  debugShowCheckedModeBanner: false,
  title: 'eCommerce App',
  theme: ThemeData(
  primarySwatch: Colors.deepPurple,
  ),
  // 3. A simple placeholder for our home screen
  home: const LoginScreen(),
  );
  }
  }



