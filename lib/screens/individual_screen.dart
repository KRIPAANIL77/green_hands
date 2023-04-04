import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:treeapp/reusable_widgets/reusable_widget.dart';
import 'package:treeapp/screens/admin_screen.dart';
import 'package:treeapp/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IndividualScreen extends StatefulWidget {
  const IndividualScreen({super.key});

  @override
  State<IndividualScreen> createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  TextEditingController namecontroller =TextEditingController();
  TextEditingController citycontroller =TextEditingController();
  TextEditingController loccontroller =TextEditingController();
  TextEditingController numcontroller =TextEditingController();
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
   final CollectionReference collectionReference2 =FirebaseFirestore.instance.collection('users');
  @override
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
           
   reusableTextField("Enter your name", Icons.add , false, namecontroller),
  
const SizedBox(
            height:20,
           ),
           reusableTextField("Enter your city name ", Icons.add ,false, citycontroller),
   const SizedBox(
            height:20,
           ),
            reusableTextField("Enter your location", Icons.add , false, loccontroller),
            const SizedBox(
            height:20,
           ),
            reusableTextField("Enter your mobile number", Icons.add , false, numcontroller),
      const SizedBox(
            height:20,
           ),
          ElevatedButton(onPressed: () async {
             await collectionReference2.add({
              "name":namecontroller.text,
              "city":citycontroller.text,
              "location": loccontroller.text,
              "number":numcontroller.text,
             }
             );
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const InfoScreen()));

          }, child: Text("REGISTER")),
          
        ],)
        ),
        
       
        ),
        ), 
      

    );
  }
}
