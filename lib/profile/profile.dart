import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:juicedates/Profile/EditProfile.dart';

class User {
  final String id;
  final String username;
  final int age;
  final Map<String, dynamic> editInfo;
  final List<String> imageUrl;

  User({
    required this.id,
    required this.username,
    required this.age,
    required this.editInfo,
    required this.imageUrl,
  });
}

class Profile extends StatefulWidget {
  final User user;
  final User currentUser;

  const Profile({
    Key? key,
    required this.user,
    required this.currentUser,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // void openEditProfileScreen() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       // builder: (context) => EditProfile(
  //       //   currentUser: widget.currentUser,
  //       //   user: User(
  //       //     id: widget.user.id,
  //       //     username: widget.user.username,
  //       //     age: widget.user.age,
  //       //     editInfo: widget.user.editInfo,
  //       //     imageUrl: widget.user.imageUrl,
  //       //   ),
  //       // ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Hero(
                tag: 'username',
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.purpleAccent,
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        // Handle the onTap action when the user taps the CircleAvatar.
                      },
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: CachedNetworkImage(
                            height: 150,
                            width: 150,
                            fit: BoxFit.fill,
                            imageUrl: widget.user.imageUrl.isNotEmpty == true
                                ? widget.user.imageUrl[0]
                                : '',
                            useOldImageOnUrlChange: true,
                            placeholder: (context, url) =>
                                const CupertinoActivityIndicator(
                              radius: 15,
                            ),
                            errorWidget: (context, url, error) => const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.error,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                Text(
                                  'Failed to load',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only (top: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.purpleAccent,
                    child: IconButton(
                      onPressed: () {
                        // Handle the button press, e.g., for opening the camera.
                      },
                      icon: const Icon(
                        Icons.photo_camera,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                // ignore: unnecessary_null_comparison
                widget.user.username != null
                    ? "${widget.user.username}, ${widget.user.age}"
                    : '',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.user.editInfo['job_title'] != null
                    ? "${widget.user.editInfo['job_title']} ${widget.user.editInfo['company'] != null ? "at ${widget.user.editInfo['company']}":""}"
                    : "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              Text(
                widget.user.editInfo['education'] != null
                    ? "${widget.user.editInfo['education']}"
                    : "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .45,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: FloatingActionButton(
                                heroTag: UniqueKey(),
                                splashColor: Colors.purpleAccent,
                                backgroundColor: Colors.purpleAccent,
                                child: const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                onPressed: () {
                                  // openEditProfileScreen();
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Add media',
                                style: TextStyle(
                                  color: Colors.purpleAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only (top: 30, left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            FloatingActionButton(
                              splashColor: Colors.purpleAccent,
                              heroTag: UniqueKey(),
                              backgroundColor: Colors.white,
                              child: const Icon(
                                Icons.settings,
                                color: Colors.purpleAccent,
                                size: 28,
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => EditProfile(
                                //       currentUser: widget.currentUser,
                                //         user: User(),
                                //     ),
                                //   ),
                                // );
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Edit Info',
                                style: TextStyle(
                                  color: Colors.purpleAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 210),
                      child: SizedBox(
                        height: 120,
                        child: CustomPaint(
                          // painter: CurvePainter(),
                          size: Size.infinite,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<User> fetchUserData(String userId) async {
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  try {
    DocumentSnapshot userSnapshot = await usersCollection.doc(userId).get();
    if (userSnapshot.exists) {
      Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

      User user = User(
        id: userId,
        username: userData['username'],
        age: userData['age'],
        editInfo: userData['editInfo'],
        imageUrl: userData['imageUrl'],
      );

      return user;
    } else {
      throw Exception('User not found');
    }
  } catch (e) {
    print('Error fetching user data: $e');
    throw e;
  }
}

