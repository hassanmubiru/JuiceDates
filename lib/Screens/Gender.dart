import 'package:flutter/material.dart';
import 'package:juicedates/Screens/UserDOB.dart';
import 'package:juicedates/info/education.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String selectedGender = ""; 

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _navigateToUserDOB() {
    if (selectedGender.isNotEmpty) { 
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  EducationBackground()), 
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a gender')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            backgroundColor: Colors.white38,
            elevation: 10,
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 50, top: 120),
            child: Text(
              'I am a',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedGender = "Man";
                    });
                  },
                  child: Text(
                    "Man",
                    style: TextStyle(
                      fontSize: 20,
                      color: selectedGender == "Man"
                          ? Colors.purpleAccent
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedGender = "Woman";
                      });
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Center(
                        child: Text(
                          'Woman',
                          style: TextStyle(
                            fontSize: 20,
                            color: selectedGender == "Woman"
                                ? Colors.purpleAccent
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedGender = "Other";
                    });
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Center(
                      child: Text(
                        'Other',
                        style: TextStyle(
                          fontSize: 20,
                          color: selectedGender == "Other"
                              ? Colors.purpleAccent
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: _navigateToUserDOB,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25),
                ),
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.065,
                child: const Center(
                  child: Text(
                    'continue',
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
        ],
      ),
    );
  }
}
