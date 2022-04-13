import 'package:flutter/material.dart';
import 'package:doctor_appoinment/constants.dart';
import 'package:doctor_appoinment/models/doctor.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class DoctorAppGridMenu extends StatelessWidget {
  const DoctorAppGridMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Category',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: kGreyColor600),
        ),
        backgroundColor: kBackground,
      ),
      backgroundColor: kBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
            ),
            padding: EdgeInsets.zero,
            itemCount: doctorMenuAll.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 81,
                  ),
                  child: Column(
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          minHeight: 69,
                          minWidth: 69,
                          maxHeight: 120,
                          maxWidth: 120,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Svg(
                              'assets/svg/${doctorMenuAll[index].image}',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Expanded(
                        child: Text(
                          doctorMenuAll[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: kGreyColor500),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
