import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:juicedates/Screens/OnboardingScreen.dart';
// import 'package:juicedates/Screens/SplashScreen.dart';
import 'package:juicedates/Screens/login.dart';
import 'package:juicedates/Screens/register.dart';
import 'package:juicedates/firebase_options.dart';
import 'package:juicedates/model/auth_provider.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => RegistrationScreen(),
          // (context) => const SplashScreen(),
          // '/onboarding': (context) => const OnboardingScreen(),
          '/login': (context) => LoginScreen(),
           '/signup': (context) => RegistrationScreen()
        },
      ),
    );
  }
}
// checking if user data exists
