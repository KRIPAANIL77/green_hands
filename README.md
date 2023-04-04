# treeapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



Run the main.dart file 
Then the user can sign up using new username, email and password .(Firebase Authentication is used)
It will ask whether the user is INDIVIDUAL/COMMUNITY or ADMIN
If the user clicks INDIVIDUAL/COMMUNITY it is redirected to the page showing two options 
1) REGISTERED 
2) NOT REGISTERED
If the option is REGISTERED ,
    the user can update the information regarding the current situation of the assigned tree.(It will store to the firebase firestore)
else 
   the user can provide their details.(It will store to the firebase firestore)
   (The code for uploading image is not included)
  
  
 For next run , 
 if the user selects ADMIN it is redirected to the page showing two options
 1) NEW REGISTRATION
 2) UPDATES BY USER
 
 If the option is NEW REGISTRATION ,
     the admin can see the details of the newly registered users (Here the admin will assign the tree id for the newly registered user  ,but the code is not included      here)
 else 
    the admin can view the updates given by the user and do necessary actions.(if the tree is in danger of falling etc.)
   
   
