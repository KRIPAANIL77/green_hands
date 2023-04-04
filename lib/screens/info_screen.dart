import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:treeapp/reusable_widgets/reusable_widget.dart';
import 'package:treeapp/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
   TextEditingController treenamecontroller =TextEditingController();
  TextEditingController idcontroller =TextEditingController();
  TextEditingController datecontroller =TextEditingController();
  TextEditingController widthcontroller =TextEditingController();
   TextEditingController alarmcontroller =TextEditingController();
   final FirebaseFirestore firestore=FirebaseFirestore.instance;
   final CollectionReference collectionReference =FirebaseFirestore.instance.collection('treedetails');
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
           
   reusableTextField("Enter name of tree", Icons.add , false, treenamecontroller),
  
const SizedBox(
            height:20,
           ),
           reusableTextField("Enter tree ID ", Icons.add , false, idcontroller),
  
const SizedBox(
            height:20,
           ),
           reusableTextField("Enter the date on which the tree is planted ", Icons.add , true, datecontroller),
   const SizedBox(
            height:20,
           ),
            reusableTextField("Enter the width of the trunk", Icons.add , true, widthcontroller),
            const SizedBox(
            height:20,
           ),
            reusableTextField("Is the tree in danger of falling ?", Icons.add , true, alarmcontroller),
      const SizedBox(
            height:20,
           ),
           ElevatedButton(onPressed: (){}, child: const Text("Upload Image")),
         const SizedBox(
            height:40,
           ),
           ElevatedButton(onPressed: () async {
            await collectionReference.add({
              
              'name':treenamecontroller.text,
              'treeid':idcontroller.text,
              'date': datecontroller.text,
              'width':widthcontroller.text,
              'alarm':alarmcontroller.text,

            }
            );
          },
           child: const Text("Submit")),
         const SizedBox(
            height:40,
           ),
          ElevatedButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const SignInScreen()));
          }, child: const Text("Logout")),
        ],)
        ),
        
       
        ),
        ), 

    );
  }
}