import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juicedates/Screens/homescreen.dart';
import 'package:juicedates/Screens/login.dart';
import 'package:juicedates/model/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error : ${snapshot.error}',
            ),
          );
        } else if (snapshot.hasData) {
          final user = snapshot.data!;
          final authProvider = Provider.of<AuthProvider>(context, listen: false);
          if (authProvider.userData != null) {
            return HomePage();
          } else {
            
            return Placeholder(); 
          }
        } else {
          // If there's no user authenticated, navigate to the login screen.
          return LoginScreen();
        }
      },
    );
  }
}
