import 'package:flutter/material.dart';
class AddImages extends StatelessWidget {
  const AddImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical:50),
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).primaryColor,width: 1
            ),
            top: BorderSide(color: Theme.of(context).primaryColor,width: 1),
            right: BorderSide(color: Theme.of(context).primaryColor,width: 1),
            left: BorderSide(color: Theme.of(context).primaryColor,width: 1),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: (){},
            ),
        ),
      ),
      

    );
  }
}