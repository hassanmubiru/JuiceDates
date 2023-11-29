import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  String? imageUrl = '';
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool isImageUploaded = false;
  Future getImage() async{
  final XFile? image = await _picker.pickImage(source:ImageSource.gallery);
  setState((){
    if (image !=null) {
      _image = File(image.path);

    } else {
      print('No image selected.');
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 120.0),
                    child: Text(
                      'Add your Image',
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                  )
                ],
              ),
              Flexible(
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: Container(
                    height: 250,
                    width: 250,
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.purpleAccent,
                      ),
                      
                    ),
                    child: _image == null ?IconButton(
                        color: Colors.purpleAccent,
                        iconSize: 60,
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: getImage,
                      ): 
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.file(
                          _image!,
                          width: 250,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      )
                  ),
                ),
               
              ),
               _image != null ? Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height *0.65,
                        width: MediaQuery.of(context).size.width *0.75,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            colors:[
                              Colors.purpleAccent.withOpacity(.5),
                              Colors.purpleAccent.withOpacity(.8),
                              Colors.purpleAccent,
                              Colors.purpleAccent,
                            ]
                          )
                        ),
                        child: const Center(
                          child:Text(
                            'Change Image',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,

                            ),
                          )
                           ),
                      
                      ),
                      onTap:getImage,
                    ),
                  ),
                )
                : SizedBox.shrink(),
                _image!= null? Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height *0.65,
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            colors: [
                              Colors.purpleAccent.withOpacity(.5),
                              Colors.purpleAccent.withOpacity(.8),
                              Colors.purpleAccent,
                              Colors.purpleAccent,
                            ]
                          )
                        ),
                        child:Text(
                            'Contuine',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,

                            ),
                          )
                      ),
                    ),
                  ),
                )
                :Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height *0.65,
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25),
                          
                        ),
                        child:const Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.deepPurpleAccent,

                              ),
                            ),
                          ),
                      ),
                      onTap: (){},
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
