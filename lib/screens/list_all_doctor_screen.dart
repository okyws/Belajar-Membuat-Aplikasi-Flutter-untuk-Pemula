import 'package:flutter/material.dart';
import 'package:doctor_appoinment/components/top_doctors_card.dart';
import 'package:doctor_appoinment/constants.dart';
import 'package:doctor_appoinment/models/doctor.dart';

class AllDoctor extends StatelessWidget {
  const AllDoctor({Key? key, String? title, this.doctor}) : super(key: key);
  final Doctor? doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List All Doctor',
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
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: allDoctor.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/doctor_details',
                    arguments: Doctor(
                      doctorName: allDoctor[index].doctorName,
                      doctorDescription: allDoctor[index].doctorDescription,
                      doctorHospital: allDoctor[index].doctorHospital,
                      doctorIsOpen: allDoctor[index].doctorIsOpen,
                      doctorNumberOfPatient:
                          allDoctor[index].doctorNumberOfPatient,
                      doctorPicture: allDoctor[index].doctorPicture,
                      doctorRating: allDoctor[index].doctorRating,
                      doctorSpecialty: allDoctor[index].doctorSpecialty,
                      doctorYearOfExperience:
                          allDoctor[index].doctorYearOfExperience,
                    ),
                  );
                },
                child: TopDoctorsCard(
                  doctor: allDoctor[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LoveButton extends StatefulWidget {
  const LoveButton({Key? key}) : super(key: key);

  @override
  _LoveButtonState createState() => _LoveButtonState();
}

class _LoveButtonState extends State<LoveButton> {
  bool isLove = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isLove ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isLove = !isLove;
        });
      },
    );
  }
}
