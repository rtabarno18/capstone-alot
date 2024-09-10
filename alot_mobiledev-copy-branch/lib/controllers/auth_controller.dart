import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = false;

  // Sign In Method
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      print('Sign in error: $e');
      return null;
    }
  }

  Future<void> resetPasswordViaEmail(BuildContext context, String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          _showErrorSnackBar(context, 'The email address is not valid.');
          break;
        case 'user-not-found':
          _showErrorSnackBar(context, 'User not found for this email.');
          break;

        default:
          return _showErrorSnackBar(context, 'Failed to send reset password email. Please try again.');
      }
    } catch (e) {
      return _showErrorSnackBar(context, 'Failed to send reset password email. Please try again.');
    }
  }

  Future<String> getUserRole(String uid) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();

      return userDoc['role'];
    } catch (e) {
      print('Error getting user role: $e');
      return 'unknown'; // or handle the error as needed
    }
  }

  // Sign Up Method with Improved Error Handling
  Future<User?> signUpWithEmail(String email, String password, String name, BuildContext context) async {
    if (!validateEmail(email)) {
      _showErrorSnackBar(context, 'Invalid email format.');
      return null;
    }

    if (password.length < 6) {
      _showErrorSnackBar(context, 'Password must be at least 6 characters long.');
      return null;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store the user's name in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        // Add other fields as needed
      });

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          _showErrorSnackBar(context, 'The email address is already in use.');
          break;
        case 'weak-password':
          _showErrorSnackBar(context, 'The password provided is too weak.');
          break;
        default:
          _showErrorSnackBar(context, 'Failed to sign up. Please try again.');
      }
      print('Sign up error: ${e.message}');
      return null;
    } catch (e) {
      print('Sign up error: $e');
      _showErrorSnackBar(context, 'Failed to sign up. Please try again.');
      return null;
    }
  }

  // Sign Out Method
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign out error: $e');
    }
  }

  // Helper method to validate email format
  bool validateEmail(String email) {
    // A basic regex for email validation
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Helper method to show error messages
  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
