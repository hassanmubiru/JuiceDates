import 'package:flutter/material.dart';
import 'package:juicedates/Screens/register.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      image: 'assets/images/romantic.png',
      title: 'Page 1',
      description: 'Welcome to Page 1',
    ),
    OnboardingPageModel(
      image: 'assets/images/juicedates.png',
      title: 'Page 2',
      description: 'Welcome to Page 2',
    ),
    OnboardingPageModel(
      image: 'assets/images/dates.png',
      title: 'Page 3',
      description: 'Welcome to Page 3',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (_currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final page = pages[index];
          return buildPage(page);
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // Handle skipping or going back, e.g., navigate to the login screen
              },
              child: const Text('Skip'),
            ),
            Row(
              children: List.generate(pages.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: _currentPage == index ? 12.0 : 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                );
              }),
            ),
            ElevatedButton(
              onPressed: nextPage,
              child: Text(_currentPage < pages.length - 1 ? 'Next' : 'Get Started'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(OnboardingPageModel page) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          page.image,
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 16.0),
        Text(
          page.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          page.description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class OnboardingPageModel {
  final String image;
  final String title;
  final String description;

  OnboardingPageModel({
    required this.image,
    required this.title,
    required this.description,
  });
}
