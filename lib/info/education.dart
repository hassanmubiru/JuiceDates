import 'package:flutter/material.dart';
import 'package:juicedates/Screens/picture_screen.dart';
import 'package:juicedates/profilepic.dart';

class EducationBackground extends StatelessWidget {
  const EducationBackground({Key? key});

  void navigateToProfilePic(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePic()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(milliseconds: 50),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            elevation: 10,
            child: const Icon(Icons.arrow_back),
            backgroundColor: Colors.white38,
            foregroundColor: Colors.deepPurpleAccent,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 120.0, left: 50),
                    child: Text(
                      'My\n Education is'.toString(),
                      style: const TextStyle(fontSize: 40.0),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Enter your education',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE040FB))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () => navigateToProfilePic(context),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }