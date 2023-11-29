import 'package:flutter/material.dart';

import 'package:juicedates/Screens/OnboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool shouldShowOnboarding = true; 

  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    if (shouldShowOnboarding) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'JUICEDATES',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32.0),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  // shouldShowOnboarding = true; 
                });
                navigateToNextScreen();
              },
              child: const Text('Getting Statered'),
            ),
          ],
        ),
      ),
    );
  }
}
