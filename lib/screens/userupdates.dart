import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserUpdates extends StatefulWidget {
  const UserUpdates({super.key});

  @override
  State<UserUpdates> createState() => _UserUpdatesState();
}

class _UserUpdatesState extends State<UserUpdates> {
  @override
    _UserInformationState createState() => _UserInformationState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('GREEN HANDS',style :GoogleFonts.acme(),),backgroundColor: Color.fromARGB(255, 123, 243, 112),),
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
            child:const Text("USER  UPDATES",style: TextStyle( fontSize: 17,color: Color.fromARGB(255, 12, 34, 32),
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
    // ignore: library_private_types_in_public_api
    _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('treedetails').snapshots();

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
            return Container(
              color:Colors.white,
              child: ListTile(
                title: 
                      Text(" ${data['name']} \n ${data['treeid']}\n${data['date']}\n ${data['width']}\n ${data['alarm']}\n",style :GoogleFonts.acme(),),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}