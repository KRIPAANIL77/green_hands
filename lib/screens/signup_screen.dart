import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:treeapp/screens/user_screen.dart';
import '../reusable_widgets/reusable_widget.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   TextEditingController pcontroller =TextEditingController();
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController usercontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:<Color>[
           Color.fromARGB(100, 0, 255, 0),
           Color.fromARGB(100, 0, 125, 0)
          ]
        )
        
      ),
      child: SingleChildScrollView(child: Padding(
        padding: EdgeInsets.fromLTRB(20,120, 20,0),
        child: Column(
          children:<Widget>[
          const SizedBox(
            height: 20,
          ),
           
           reusableTextField("Enter UserName ", Icons.person, false, usercontroller),
            const SizedBox(
            height:30,
           ),
           reusableTextField("Enter Email Id", Icons.email , false, emailcontroller),
const SizedBox(
            height:30,
           ),
          reusableTextField("Enter Password", Icons.lock , true, pcontroller),
const SizedBox(
            height:30,
           ),
          
          inupButton(context, true, (){
            
            FirebaseAuth.instance.createUserWithEmailAndPassword(
             email: emailcontroller.text
          , password: pcontroller.text).then((value){
             

           });
           Navigator.push(context,MaterialPageRoute(builder: (context)=>UserScreen()));//.onError((error, stackTrace) {
            
             

}),
         
          ]),
      ),),
      ),
    );
  }
}