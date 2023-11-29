import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'; 
import 'dart:io'; 

class ImageContainer extends StatefulWidget {
  const ImageContainer({super.key});

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
            top: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
            left: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
            right: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () async {
              _pickImage(context); // Pass the context here
            },
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    try {
      final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image was selected')),
        );
      } else {
        // Upload the selected image to Firebase Storage
        _uploadImageToStorage(File(pickedImage.path), context);
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $error')),
      );
    }
  }

  void _uploadImageToStorage(File imageFile, BuildContext context) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString(); 
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('images/$fileName.jpg');
      UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
      await uploadTask.whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image uploaded to Firebase Storage')),
        );
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading image: $error')),
      );
    }
  }
}
