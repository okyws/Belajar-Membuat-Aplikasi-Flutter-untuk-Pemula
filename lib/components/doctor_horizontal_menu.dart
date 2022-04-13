import 'package:flutter/material.dart';
import 'package:doctor_appoinment/components/doctor_app_grid_menu.dart';
import 'package:doctor_appoinment/constants.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class DoctorHorizontalMenu extends StatelessWidget {
  const DoctorHorizontalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  InkWell(
                    child: const Image(
                      width: 81,
                      height: 81,
                      image: Svg('assets/svg/img-consultation.svg'),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Consultation',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: kGreyColor500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  InkWell(
                    child: const Image(
                      width: 81,
                      height: 81,
                      image: Svg('assets/svg/img-dental.svg'),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Dental',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: kGreyColor500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  InkWell(
                    child: const Image(
                      width: 81,
                      height: 81,
                      image: Svg('assets/svg/img-heart.svg'),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Heart',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: kGreyColor500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  InkWell(
                    child: const Image(
                      width: 81,
                      height: 81,
                      image: Svg('assets/svg/img-hospital.svg'),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Hospital',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: kGreyColor500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  InkWell(
                    child: const Image(
                      width: 81,
                      height: 81,
                      image: Svg('assets/svg/img-all.svg'),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const DoctorAppGridMenu(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'View All',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: kGreyColor500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
