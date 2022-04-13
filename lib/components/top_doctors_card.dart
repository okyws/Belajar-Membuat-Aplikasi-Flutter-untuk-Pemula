import 'package:flutter/material.dart';
import 'package:doctor_appoinment/constants.dart';
import 'package:doctor_appoinment/models/doctor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TopDoctorsCard extends StatelessWidget {
  const TopDoctorsCard({Key? key, this.doctor}) : super(key: key);

  final Doctor? doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        color: Colors.transparent,
        height: 80,
        width: MediaQuery.of(context).size.width - 32,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'assets/images/${doctor!.doctorPicture}',
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  width: 88,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/${doctor!.doctorPicture}',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: doctor!.doctorName,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        doctor!.doctorName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: kGreyColor600),
                      ),
                    ),
                  ),
                  Text(
                    '${doctor!.doctorSpecialty} • ${doctor!.doctorHospital}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 136,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            RatingBar.builder(
                              itemSize: 16,
                              initialRating: double.parse(
                                doctor!.doctorRating,
                              ),
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemPadding: EdgeInsets.zero,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: kYellowColor,
                              ),
                              onRatingUpdate: (rating) {
                                debugPrint(rating.toString());
                              },
                              unratedColor: kGreyColor600,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '(${doctor!.doctorNumberOfPatient})',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: kGreyColor600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24,
              child: LoveButton(
                key: key,
              ),
            ),
          ],
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
