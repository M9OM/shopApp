import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



Future<User?> createUserWithEmailAndPassword(String email, String password, String displayName, String phoneNumber) async {
  try {
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Check if user creation was successful
    if (userCredential.user != null) {
      // Store user data in Firestore
      await storeUserData(userCredential.user!, displayName, phoneNumber);
    }

    return userCredential.user;
  } catch (e) {
    print('Error creating user: $e');
    return null;
  }
}

  Future<User?> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
 
      return userCredential.user;
    } catch (e) {
                   ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('الايميل او كلمة السر غير صحيحة'),
          ),
        );
      print('Error signing in: $e');
      return null;
    }
  }
  Future<void> deleteAccount(BuildContext context) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
        signOut();
        // عملية حذف الحساب تمت بنجاح
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حذف الحساب بنجاح'),
          ),
        );
      }
    } catch (e) {
      // حدث خطأ أثناء حذف الحساب
      print('Error deleting account: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء حذف الحساب'),
        ),
      );
    }
  }


  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Future<void> storeUserData(User user, String displayName, String phoneNumber) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'displayName': displayName,
        'phoneNumber':phoneNumber
        // Add more user data fields as needed
      });
    } catch (e) {
      print('Error storing user data: $e');
    }
  }

}
