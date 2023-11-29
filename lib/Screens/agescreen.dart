import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:juicedates/Screens/genderscreen.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int age = 18;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center( 
              child: Container(
                child: Text(
                  'What is your age?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: NumberPicker(
                    itemWidth: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    maxValue: 120,
                    value: age,
                    minValue: 18,
                    onChanged: (value) {
                      setState(() {
                        age = value;
                      });

                      // Store the selected age in Firestore
                      _storeAgeInFirestore(value);
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to GenderScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GenderScreen(), 
                  ),
                );
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to store age in Firestore
  void _storeAgeInFirestore(int age) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _firestore.collection('users').doc(user.uid).update({
        'age': age,
      });
    }
  }
}
