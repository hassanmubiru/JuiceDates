import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key, required this.imageurl});
final String imageurl;
  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  TextEditingController aboutController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController livingController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Add Photos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.purpleAccent,
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50)
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height *.65,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.count(
                    crossAxisCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: MediaQuery.of(context).size.aspectRatio *1.5,
                    crossAxisSpacing: 4,
                    padding: const EdgeInsets.all(10),
                    children:List.generate(9, (index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid,
                              )
                            ),
                            child:  Stack(
                              children: <Widget>[
                                // CachedNetworkImage(
                                //   height: MediaQuery.of(context).size.height *.2,
                                //   fit: BoxFit.cover,
                                //   imageUrl: imageurl![index]
                                // ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color:Colors.purpleAccent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const InkWell(
                                    child: Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.purpleAccent,
                                      size: 22,
                                    ),
                                  ),
                                ),
                              )
                              ],
                            ),
                          ),

                        ),
                      );
                    })

                  ),

                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 340,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(
                        colors:[
                          Colors.purpleAccent,
                          Colors.purpleAccent,
                          Colors.purpleAccent.withOpacity(0.8),
                          Colors.purpleAccent.withOpacity(0.5),

                        ]
                      )
                    ),
                    child: const Center(
                      child: Text(
                        'Add Media',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: (){},

                ),
                const Gap(20),
                const Divider(),
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListBody(
                    mainAxis: Axis.vertical,
                    children: <Widget>[
                      ListTile(
                      title: const Text(
                        'About',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      
                      subtitle: CupertinoTextField(
                        cursorColor: Colors.purpleAccent,
                        controller:aboutController,
                        maxLines: 10,
                        minLines: 3,
                        placeholder: 'About you',
                        padding: const EdgeInsets.all(10),
                        onChanged: (value){},
                      ) ,
                      
                      ),
                      ListTile(
                      title: const Text(
                        'Job title',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      
                      subtitle: CupertinoTextField(
                        cursorColor: Colors.purpleAccent,
                        controller:jobController,
                        maxLines: 10,
                        minLines: 3,
                        placeholder: 'Add your job title',
                        padding: const EdgeInsets.all(10),
                        onChanged: (value){},
                      ) ,
                      
                      ),
                      ListTile(
                      title: const Text(
                        'Eduction Background',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      
                      subtitle: CupertinoTextField(
                        cursorColor: Colors.purpleAccent,
                        controller:aboutController,
                        maxLines: 10,
                        minLines: 3,
                        placeholder: 'Add your education',
                        padding: const EdgeInsets.all(10),
                        onChanged: (value){},
                      ) ,
                      
                      ),
                      ListTile(
                      title: const Text(
                        'Livinf in',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      
                      subtitle: CupertinoTextField(
                        cursorColor: Colors.purpleAccent,
                        controller:aboutController,
                        maxLines: 10,
                        minLines: 3,
                        placeholder: 'Add city',
                        padding: const EdgeInsets.all(10),
                        onChanged: (value){},
                      ) ,
                      
                      ),
                      ListTile(
                      title: const Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      
                      subtitle: CupertinoTextField(
                        cursorColor: Colors.purpleAccent,
                        controller:aboutController,
                        maxLines: 10,
                        minLines: 3,
                        placeholder: 'Edit your phone number',
                        padding: const EdgeInsets.all(10),
                        onChanged: (value){},
                      ) ,
                      
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}