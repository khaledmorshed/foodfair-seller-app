import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../splashScreen/splash_screen.dart';

Future<void> main() async {
  //what is for dont know. have to know
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   //await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
