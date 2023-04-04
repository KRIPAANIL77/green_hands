import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'dart:ui';

class NewReg extends StatefulWidget {
  const NewReg({super.key});

  @override
  State<NewReg> createState() => _NewRegState();
}

class _NewRegState extends State<NewReg> {
 
@override
    _UserInformationState createState() => _UserInformationState();




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
        
           Container(
            height: 20,
            width:MediaQuery.of(context).size.width,
            child:const Text("NEW REGISTRATION",style: TextStyle( fontSize: 17,color: Color.fromARGB(255, 12, 34, 32),
                fontWeight: FontWeight.bold ),),
                alignment: Alignment.center,
           ),
            const UserInformation(),
          
          
      
   
        ],)

       
        
        ),
        
       
        ),
        ), 
       
    );
 


  }
}


class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
    _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
           shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          //print(data['name']);
            return Container(
              height:100,
              color: Colors.white,
              width:MediaQuery.of(context).size.width,
              child: ListTile(
                
                title: 
                      Text( "${data['name']}\n ${data['city']}\n${data['location']} \n${data['number']}\n",style :GoogleFonts.acme(),),
                        
                
              ),
            );
          }).toList(),
        );
       
      },
    );
    
  }
  
}