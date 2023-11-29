import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juicedates/Profile/EditProfile.dart';
import 'package:juicedates/Screens/chatscreen.dart';
import 'package:juicedates/Screens/expolore_match.dart';
import 'package:juicedates/Screens/login.dart';
import 'package:provider/provider.dart';
import 'package:juicedates/model/auth_provider.dart';
import 'package:juicedates/model/user.dart' ;

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = FirebaseAuth.instance.currentUser;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Call the signOut method when the user taps the sign-out button
              authProvider.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: user != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Welcome, ${user.displayName ?? 'User'}!'),
                  Text('Email: ${user.email ?? 'No email available'}'),
                  // Text('Age: ${authProvider.userData?.age ?? 'N/A'}'),
                  Text('Age: ${authProvider.userData?.age ?? 'Unknown'}'),
                  Text('Gender: ${authProvider.userData?.gender ?? 'N/A'}'),
                ],
              )
            : const Text('User data not available.'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          )
        ],
        onTap: (int index) {
          if (index == 0) {
            if (user != null) {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => EditProfile(
              //     currentUser: user,
              //     user: user,
              //   ),
              // ));
            }
          } else if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ExploreScreen(),
            ));
          } else if (index == 2) {
            if (user != null) {
              // Replace 'receiverUserIdValue' and 'receiverUsernameValue' with actual values
              const receiverUserId = 'receiverUserIdValue';
              const receiverUsername = 'receiverUsernameValue';

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatScreen(
                  receiverUserId: receiverUserId,
                  receiverUsername: receiverUsername,
                ),
              ));
            }
          }
        },
      ),
    );
  }
}
