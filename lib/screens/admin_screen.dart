import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treeapp/screens/individual_screen.dart';
import 'package:treeapp/screens/newreg.dart';
import 'package:treeapp/screens/regoruse.dart';
import 'package:treeapp/screens/signin_screen.dart';
import 'package:treeapp/screens/userupdates.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('GREEN HANDS',style :GoogleFonts.acme(),),backgroundColor: const Color.fromARGB(255, 123, 243, 112),),
      body:  Container(
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
            ElevatedButton(child: const Text("NEW REGISTRATION"),
      onPressed: (){
        
 Navigator.push(context,MaterialPageRoute(builder: (context)=> const NewReg()));// UserInformation()));
      },
          ),
         const SizedBox(
            height:20,
           ),

  ElevatedButton(child: const Text("UPDATES BY USER"),
      onPressed: (){
        
 Navigator.push(context,MaterialPageRoute(builder: (context)=>const UserUpdates()));
      },
          ),
   
        ],)
        ),
        
       
        ),
        ), 

    );
  
  }
}