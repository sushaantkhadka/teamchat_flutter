import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teamchat/helper/helper_function.dart';
import 'package:teamchat/pages/auth/login_page.dart';
import 'package:teamchat/pages/home_page.dart';
import 'package:teamchat/shared/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAx5PnCFkbRnI_Y-NgfBR7qTUoL1RELEFs",
            authDomain: "teamchat-2038f.firebaseapp.com",
            projectId: "teamchat-2038f",
            storageBucket: "teamchat-2038f.appspot.com",
            messagingSenderId: "637872687540",
            appId: "1:637872687540:web:18f5544cc5be1ca4a10ae1",
            measurementId: "G-E7PRBBYD80"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStauts().then((value) {
      if (value != null) {
        _isSignedIn = value;
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Constant().primaryColor,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}
