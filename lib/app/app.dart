import 'package:cotizadeprisa/app/screens/login_process/login.dart';
import 'package:cotizadeprisa/app/screens/intro_screens/introductionScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? _loggedIn;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    _loadPreferences();
    super.initState();
  }

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _loggedIn = prefs.getBool('firstTime') ?? true;
      //_firstTime = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color primary = const Color.fromARGB(255, 109, 177, 177);
    //Color backgroundColor = const Color.fromARGB(255, 255, 250, 245);

    return MaterialApp(
        title: 'CotizApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: primary,
          ),
          primaryColor: primary,
          canvasColor: const Color.fromARGB(255, 253, 170, 41),
          hintColor: const Color.fromARGB(255, 60, 60, 60),
          shadowColor: const Color.fromARGB(255, 160, 160, 160),
          primarySwatch: Colors.blue,
        ),
        home: mainScreen());
  }
}

Widget mainScreen() {
  if (_loggedIn == true) {
    return const LoginPage();
  } else {
    return const IntroductionScreen();
  }
}
