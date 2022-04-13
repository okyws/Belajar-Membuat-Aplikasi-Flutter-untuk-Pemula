import 'package:flutter/material.dart';
import 'package:doctor_appoinment/constants.dart';
import 'package:doctor_appoinment/models/doctor.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Doctor;

    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text(
          args.doctorName,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: kGreyColor600),
        ),
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () async {
                await Share.share(
                  '${args.doctorName}, \n${args.doctorName} ${args.doctorDescription}',
                );
              },
              child: const Icon(
                Icons.share,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Hero(
                  tag: 'assets/images/${args.doctorPicture}',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: kGreyColor800,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/${args.doctorPicture}',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Hero(
                        tag: args.doctorName,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            args.doctorName,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: kGreyColor500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${args.doctorSpecialty} • ${args.doctorHospital} ',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: kGreyColor600),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '${args.doctorName} • ${args.doctorDescription} ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: kGreyColor700,
                              fontFamily:
                                  GoogleFonts.sourceSansPro().fontFamily,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Spacer(),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Experience',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: kGreyColor600,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      args.doctorYearOfExperience,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'yr',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              color: kGreyColor400,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Patient',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: kGreyColor600,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      args.doctorNumberOfPatient,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'ps',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              color: kGreyColor400,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Rating',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: kGreyColor600,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      args.doctorRating,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 56,
              width: 56,
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: (() {
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
                }),
                child: const Image(
                  image: Svg(
                    'assets/svg/icon-chat.svg',
                    size: Size(
                      36,
                      36,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              height: 56,
              child: OutlinedButton(
                onPressed: () {
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
                child: Text(
                  'Make an Appoinment',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              width: MediaQuery.of(context).size.width - 104,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kGreenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
  ),
);
