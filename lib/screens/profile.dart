import 'package:flutter/material.dart';
import 'package:doctor_appoinment/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, String? title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: kGreyColor600),
        ),
        backgroundColor: kBackground,
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Image(
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.cover,
                color: kBackground,
                image: const NetworkImage(
                  'https://media.istockphoto.com/photos/orange-golden-background-blur-bokeh-texture-drops-picture-id536404139?b=1&k=20&m=536404139&s=170667a&w=0&h=WJXlLSpa67jfM_st1xKTITXoKmg6I2zOVsc3fJYR7LQ=',
                ),
              ),
              Positioned(
                bottom: 120,
                width: 130,
                height: 130,
                child: Hero(
                  tag: 'assets/images/profile.png',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: kBackground,
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/profile.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                child: Column(children: const [
                  Text(
                    'Oky Wahyu Setyaji',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    'Mahasiswa',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ]),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 30, right: 30, bottom: 8),
            child: Text(
              'Account Info',
              style: TextStyle(fontSize: 25, color: kGreyColor500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      launch('https://www.dicoding.com/users/okyows/');
                    },
                    icon: const Icon(
                      Icons.person_outline,
                      size: 32,
                      color: kGreyColor800,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: kGreyColor800,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Oky Wahyu Setyaji',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kGreyColor600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      launch('tel:+62 895329921351');
                    },
                    icon: const Icon(
                      Icons.phone_outlined,
                      size: 32,
                      color: kGreyColor800,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Mobile',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: kGreyColor800,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '+62895329921351',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kGreyColor600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      launch(
                          'mailto:okywahyu1@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                    },
                    icon: const Icon(
                      Icons.email_outlined,
                      size: 32,
                      color: kGreyColor800,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: kGreyColor800,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'okywahyu1@gmail.com',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kGreyColor600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      launch(
                          'https://www.google.com/maps/dir//Bandung,+Kota+Bandung,+Jawa+Barat/@-6.903429,107.5030708,11z/data=!4m9!4m8!1m0!1m5!1m1!1s0x2e68e6398252477f:0x146a1f93d3e815b2!2m2!1d107.6191228!2d-6.9174639!3e0');
                    },
                    icon: const Icon(
                      Icons.house_outlined,
                      size: 32,
                      color: kGreyColor800,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: kGreyColor800,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Bandung',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kGreyColor600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.cake_outlined,
                    size: 32,
                    color: kGreyColor800,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Age',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: kGreyColor800,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '23',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kGreyColor600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.github,
                      color: kGreyColor800,
                    ),
                    onPressed: () {
                      launch('https://github.com/okyws/');
                    }),
              ),
              Expanded(
                child: IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: kGreyColor800,
                    ),
                    onPressed: () {
                      launch('https://id.linkedin.com/');
                    }),
              ),
              Expanded(
                child: IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.facebook,
                      color: kGreyColor800,
                    ),
                    onPressed: () {
                      launch('https://fb.com/okyows/');
                    }),
              ),
              Expanded(
                child: IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.instagram,
                      color: kGreyColor800,
                    ),
                    onPressed: () {
                      launch('https://instagram.com/okyws1/');
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
