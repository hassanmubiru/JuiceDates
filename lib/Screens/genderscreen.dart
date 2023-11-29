import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:juicedates/Screens/picture_screen.dart';
import 'package:juicedates/info/education.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Your Gender',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderRadioButton(
                  label: 'Male',
                  value: 'Male',
                  selectedGender: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                const SizedBox(width: 20),
                GenderRadioButton(
                  label: 'Female',
                  value: 'Female',
                  selectedGender: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _storeGenderInFirestore(selectedGender);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const EducationBackground(), 
                  ),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  void _storeGenderInFirestore(String? gender) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && gender != null) {
      _firestore.collection('users').doc(user.uid).update({
        'gender': gender,
      });
    }
  }
}

class GenderRadioButton extends StatelessWidget {
  final String label;
  final String value;
  final String? selectedGender;
  final void Function(String?)? onChanged;

  GenderRadioButton({
    required this.label,
    required this.value,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedGender,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    );
  }
}
