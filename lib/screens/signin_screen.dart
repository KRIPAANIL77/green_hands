import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:treeapp/screens/signup_screen.dart';
import 'package:treeapp/screens/user_screen.dart';

import '../reusable_widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController pcontroller =TextEditingController();
  TextEditingController emailcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        decoration:   const BoxDecoration(
          gradient: LinearGradient(
          begin:Alignment.topCenter,
          end:Alignment.bottomCenter,
          colors:<Color>[
              Color.fromARGB(255, 244, 242, 248),
              Color.fromARGB(255, 204, 232, 202),
              Color.fromARGB(255, 154, 241, 149),
              Color.fromARGB(255, 123, 243, 112),
             
        ],),),

        child: SingleChildScrollView(
          child:
        Padding(padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.2, 20, 0),
        child: Column(children: [
          const SizedBox(
            height:20,
           ),
           Image.asset('assets/images/tree2.png',
           height:60,
           width:60,
           ),
           const SizedBox(
            height:20,
           ),
           reusableTextField("Enter Email Id ", Icons.person, false, emailcontroller),
            const SizedBox(
            height:20,
           ),
           reusableTextField("Enter Password", Icons.lock , true, pcontroller),
const SizedBox(
            height:20,
           ),
inupButton(context, true, (){
FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: pcontroller.text).then((value){
Navigator.push(context,MaterialPageRoute(builder: (context)=>UserScreen()));

}).onError((error, stackTrace) {
  print("Error");
 Text("Enter valid emailid and password");
},);
},
),
 const SizedBox(
            height:20,
           ),
  const Text("Don't have an account ?",
      style :TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
     GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));

      },

      child: const Text(" Sign Up",
      style :TextStyle(color:Colors.white,fontWeight: FontWeight.bold),
      ),
     ),
      
        ],)
        ),
        
       
        ),
        ),
      );
  }
  Row signUpOption(){
  return Row(
    children: [
      const Text("Don't have an account ?",
      style :TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
     GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));

      },
     ),
      const Text("Sign Up",
      style :TextStyle(color:Colors.white,fontWeight: FontWeight.bold))
    ],
  );
}
}

