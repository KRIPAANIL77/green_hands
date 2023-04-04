import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:treeapp/screens/signin_screen.dart';

 
void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
   
 await  Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: "AIzaSyDHz9xWdNa7sl6O4VD88jC_TY0age4CXTA",
      authDomain: "treeapp-gs.firebaseapp.com",
      projectId: "treeapp-gs",
      storageBucket: "treeapp-gs.appspot.com",
      messagingSenderId: "695598436409",
      appId: "1:695598436409:web:57107cd357f08e7fb17de8",
      measurementId: "G-7S893920KG"
      
    ),
  
   );
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      
      home:AnimatedSplashScreen(splash:  'assets/images/tree2.png' ,
           
      duration: 3000,
      splashTransition: SplashTransition.scaleTransition,
     
      backgroundColor: Colors.white,
     
       nextScreen: const SignInScreen())
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
     
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
       
    );
  }
}*/
