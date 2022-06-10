import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//
// Future<User> createAccount(String name, String email, String password) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   try {
//     User? user = (await _auth.createUserWithEmailAndPassword(
//             email: email, password: password))
//         .user;
//
//     if (user != null) {
//       print("Account Created Successfully");
//
//       await _firestore.collection('users').doc(_auth.currentUser?.uid).set({
//         "name": name,
//         "email": email,
//         "status": "Unavailable",
//       });
//       return user;
//     } else {
//       print("Account Creation Failed");
//       return user;
//     }
//   } catch (e) {
//     print(e);
//   }
// }

// class UserPreferences {
//   static const myUser = User (
//     imagePath: 'user_pic.png'
//       name:
//       email:
//
//   )
// }
