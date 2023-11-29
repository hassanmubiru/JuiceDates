import 'package:flutter/material.dart';
import 'imagecontainer.dart';
import 'homescreen.dart'; // Assuming you have a HomePage defined in 'homescreen.dart'

class PictureScreen extends StatelessWidget {
  const PictureScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                'Add Photos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              ),
              
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ImageContainer(),
                  ImageContainer(),
                  ImageContainer(),
                ],
              ),
              Row(
                children: [
                  ImageContainer(),
                  ImageContainer(),
                  ImageContainer(),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(), 
                ),
              );
            },
            child: const Text('Finish'),
          ),
        ],
      ),
    );
  }
}
