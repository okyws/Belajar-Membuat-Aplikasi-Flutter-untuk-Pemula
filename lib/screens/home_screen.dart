import 'package:flutter/material.dart';
import 'package:doctor_appoinment/components/doctor_horizontal_menu.dart';
import 'package:doctor_appoinment/components/home_screen_navbar.dart';
import 'package:doctor_appoinment/components/top_doctors_list.dart';
import 'package:doctor_appoinment/constants.dart';
import 'package:doctor_appoinment/screens/list_all_doctor_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeScreenNavbar(),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline1,
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Find ',
                        style: TextStyle(color: kGreyColor600),
                      ),
                      TextSpan(
                        text: 'your doctor',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: kGreyColor800,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 56,
                  padding: const EdgeInsets.only(
                    right: 8,
                    left: 16,
                    bottom: 5,
                    top: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kGreyColor700,
                  ),
                  child: TextField(
                    onSubmitted: (String value) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: OutlinedButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ),
                            ],
                            title: const Text("Not Implemented"),
                            content: const Text(
                                'Sorry, this feature still under development'),
                          );
                        },
                      );
                    },
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: kBlackColor900,
                        ),
                    cursorHeight: 24,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.search,
                        color: kBlackColor900,
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        maxHeight: 24,
                      ),
                      hintText: 'Search doctor, medicines etc',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: kBlackColor800),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: DoctorHorizontalMenu(),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Doctors',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: kGreyColor500),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AllDoctor(),
                          ),
                        );
                      },
                      child: Text(
                        'View all',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: kBlueColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const TopDoctorsList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
