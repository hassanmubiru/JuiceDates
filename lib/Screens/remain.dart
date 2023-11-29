// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:juicedates/json/profile_json.dart';
// import 'package:juicedates/model/user_data.dart';

// class ProfileScreen extends StatelessWidget {
//   final String userId;

//   ProfileScreen({Key? key, required this.userId}) : super(key: key);

//   // ... (Previous code)

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.withOpacity(0.2),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.red,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: getBody(),
//     );
//   }

//   Widget getBody() {
//     var size = MediaQuery.of(context).size;
//     return ClipPath(
//       clipper: OvalBottomBorderClipper(),
//       child: Container(
//         width: size.width,
//         height: size.height * 0.60,
//         decoration: BoxDecoration(color: Colors.white, boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 10,
//             blurRadius: 10,
//           ),
//         ]),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 width: 140,
//                 height: 140,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: _profileImageUrl.isNotEmpty
//                         ? NetworkImage(_profileImageUrl)
//                         : AssetImage(profile_json[0]['img']) as ImageProvider<Object>,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Text(
//                 profile_json[0]['name'] + ", " + profile_json[0]['age'],
//                 style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.1),
//                               spreadRadius: 10,
//                               blurRadius: 15,
//                             ),
//                           ],
//                         ),
//                         child: Icon(
//                           Icons.settings,
//                           size: 35,
//                           color: Colors.grey.withOpacity(0.5),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "SETTINGS",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey.withOpacity(0.8),
//                         ),
//                       )
//                     ],
//                   ),
                                  
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Container(
//                       width: 140,
//                       height: 140,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: _profileImageUrl.isNotEmpty
//                               ? NetworkImage(_profileImageUrl)
//                               : AssetImage(profile_json[0]['img']) as ImageProvider<Object>,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Text(
//                       profile_json[0]['name'] + ", " + profile_json[0]['age'],
//                       style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     spreadRadius: 10,
//                                     blurRadius: 15,
//                                   ),
//                                 ],
//                               ),
//                               child: Icon(
//                                 Icons.settings,
//                                 size: 35,
//                                 color: Colors.grey.withOpacity(0.5),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "SETTINGS",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey.withOpacity(0.8),
//                               ),
//                             )
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: 85,
//                                 height: 85,
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       width: 80,
//                                       height: 80,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         gradient: const LinearGradient(
//                                           colors: [
//                                             Color(0xFFfc3973),
//                                             Color(0xFFfd5f60),
//                                           ],
//                                         ),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.1),
//                                             spreadRadius: 10,
//                                             blurRadius: 15,
//                                           ),
//                                         ],
//                                       ),
//                                       child: const Icon(
//                                         Icons.camera_alt,
//                                         size: 45,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     Positioned(
//                                       bottom: 8,
//                                       right: 0,
//                                       child: Container(
//                                         width: 25,
//                                         height: 25,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.white,
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color: Colors.grey.withOpacity(0.1),
//                                               spreadRadius: 10,
//                                               blurRadius: 15,
//                                             ),
//                                           ],
//                                         ),
//                                         child: const Center(
//                                           child: Icon(
//                                             Icons.add,
//                                             color: Color(0xFFFD5C61),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 "ADD MEDIA",
//                                 style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.grey.withOpacity(0.8)),
//                               )
//                             ],
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     spreadRadius: 10,
//                                     blurRadius: 15,
//                                   ),
//                                 ],
//                               ),
//                               child: Icon(
//                                 Icons.edit,
//                                 size: 35,
//                                 color: Colors.grey.withOpacity(0.5),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "EDIT INFO",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey.withOpacity(0.8),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),

//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
