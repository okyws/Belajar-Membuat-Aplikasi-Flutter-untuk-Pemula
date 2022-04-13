import 'package:flutter/material.dart';
import 'package:doctor_appoinment/constants.dart';
import 'package:doctor_appoinment/doctor_app_theme.dart';
import 'package:doctor_appoinment/screens/doctor_detail_screen.dart';
import 'package:doctor_appoinment/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(App(showHome: showHome));
}

class App extends StatelessWidget {
  final bool showHome;

  const App({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: DoctorAppTheme.lightTheme,
      routes: {
        '/': (context) =>
            showHome ? const HomeScreen() : const OnBoardingScreen(),
        '/doctor_details': (context) => const DoctorDetailScreen(),
      },
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                subtitle,
                style: const TextStyle(color: kGreyColor600, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                color: kBackground,
                urlImage: 'assets/images/onboarding-1.png',
                title: 'Consult Specialist Doctors \nSecurely And Privately',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit at velit facilisi massa fringilla cum. Elit feugiat aliquam sed sed arcu eget integer cursus rhoncus.',
              ),
              buildPage(
                color: kBackground,
                urlImage: 'assets/images/onboarding-3.png',
                title: 'Find A Doctor',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit at velit facilisi massa fringilla cum. Elit feugiat aliquam sed sed arcu eget integer cursus rhoncus.',
              ),
              buildPage(
                color: kBackground,
                urlImage: 'assets/images/onboarding-2.png',
                title: 'Make A Doctor Apoinment',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit at velit facilisi massa fringilla cum. Elit feugiat aliquam sed sed arcu eget integer cursus rhoncus.',
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  primary: Colors.white,
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: const Size.fromHeight(80),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 24),
                ),
              )
            : Container(
                color: kBackground,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: Text(
                        'Skip',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.teal.shade600),
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.teal.shade700,
                        ),
                        onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => controller.nextPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeInOut,
                      ),
                      child: Text(
                        'Next',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.teal.shade600),
                      ),
                    ),
                  ],
                ),
              ),
      );
}
