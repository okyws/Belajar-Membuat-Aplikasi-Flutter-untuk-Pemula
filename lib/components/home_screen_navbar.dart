import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doctor_appoinment/constants.dart';
import 'package:doctor_appoinment/screens/profile.dart';

class HomeScreenNavbar extends StatelessWidget {
  const HomeScreenNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Hero(
              tag: 'assets/images/profile.png',
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ),
                    );
                  },
                  child: const SizedBox(
                    width: 48,
                    height: 48,
                    child: CircleAvatar(
                      backgroundColor: kBlueColor,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome back,",
                  style: TextStyle(fontSize: 13.0, color: kGreyColor900),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Oky Wahyu S",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: kGreyColor600,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              /** Load onboarding when open app
               * 
               *    onPressed: () async {
               *      final pref = await SharedPreferences.getInstance();
               *      pref.setBool('showHome', false);
               *      SystemNavigator.pop();
               *    },
               * 
               */
              icon: const Icon(
                Icons.exit_to_app,
                color: kGreyColor600,
              ),
            )
          ],
        )
      ],
    );
  }
}
