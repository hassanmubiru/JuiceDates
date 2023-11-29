import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juicedates/Screens/Gender.dart';

class UserDOB extends StatefulWidget {
  const UserDOB({Key? key}) : super(key: key);

  @override
  State<UserDOB> createState() => _UserDOBState();
}

class _UserDOBState extends State<UserDOB> {
  late DateTime selectedDate;
  TextEditingController dobController = TextEditingController();

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
            elevation: 10,
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: Colors.white38,
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 120),
                    child: Text(
                      'My\nbirthday is',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  child: buildDatePicker(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: buildContinueButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return ListTile(
      title: CupertinoTextField(
        readOnly: true,
        keyboardType: TextInputType.phone,
        prefix: IconButton(
          icon: const Icon(
            Icons.calendar_today,
            color: Colors.purpleAccent,
          ),
          onPressed: () {},
        ),
        onTap: () => showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: GestureDetector(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime(2000, 10, 12),
                  backgroundColor: Colors.white,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      dobController.text = newDate.day.toString() +
                          '/' +
                          newDate.month.toString() +
                          '/' +
                          newDate.year.toString();
                      selectedDate = newDate;
                    });
                  },
                  maximumYear: 2002,
                  minimumYear: 1900,
                  maximumDate: DateTime(2002, 03, 12),
                  mode: CupertinoDatePickerMode.date,
                ),
                onTap: () {
                  print(dobController.text);
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
        placeholder: 'DD/MM/YYYY',
        controller: dobController,
      ),
    );
  }

  Widget buildContinueButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: _navigateToEducation,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25),
          ),
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.75,
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
    );
  }

  void _navigateToEducation() {
    // Pass the userData object to the EducationBackground screen.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Gender(),
      ),
    );
  }
}
