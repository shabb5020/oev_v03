import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import '../animations/fade_animation.dart';
import '../animations/slide_animation.dart';
import '../animations/page_transition.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: const _ApplicationBar(),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: FadeAnimation(
                  intervalEnd: 0.4,
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/images/runner.svg',
                        width: 60,
                      ),
                      SizedBox(width: 18),
                      Text(
                        'Start Exploring',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: SlideAnimation(
                intervalEnd: 0.55,
                child: FadeAnimation(
                  intervalEnd: 0.55,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Dsignes',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(
                          text: 'Find Events and',
                        ),
                        TextSpan(
                          text: '\nBuy Tickets using',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dsignes',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: SlideAnimation(
                intervalEnd: 0.55,
                begin: const Offset(0, 30),
                child: FadeAnimation(
                  intervalEnd: 0.55,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'OEV Coins',
                        style: TextStyle(
                          fontFamily: 'Dsignes',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          height: 1.3,
                        ),
                      ),
                      //const ColoredText(text: 'Coins'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 28),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: FadeAnimation(
                child: Text(
                    'Digital marketplace for booking events using OEV coins',
                    style: TextStyle(
                      fontSize: 15,
                    )
                    //style: bodyTextStyle
                    ),
              ),
            ),
            SizedBox(height: 35),
            Container(
              height: 200,
              padding: EdgeInsets.only(left: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SlideAnimation(
                    intervalStart: 0.55,
                    begin: const Offset(0, 20),
                    child: FadeAnimation(
                      intervalStart: 0.55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          AppStat(
                            title: '10+',
                            subtext: 'Partners',
                          ),
                          AppStat(
                            title: '20+',
                            subtext: 'Events',
                          ),
                          AppStat(
                            title: '100+',
                            subtext: 'Tickets',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 60),
                  Expanded(
                    child: SlideAnimation(
                      intervalStart: 0.55,
                      child: FadeAnimation(
                        intervalEnd: 0.55,
                        child: Container(
                          padding: EdgeInsets.all(24),
                          decoration: const BoxDecoration(
                            color: Colors.blueGrey,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: HomeScreen(),
                                      type: PageTransitionType.fadeIn,
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                  child: const Icon(Iconsax.arrow_right_1),
                                ),
                              ),
                              SizedBox(height: 24),
                              Text(
                                'Explore \nEvents',
                                style: TextStyle(
                                  letterSpacing: 8,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  height: 1.3,
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(
                                color: Colors.black,
                                endIndent: 80,
                                thickness: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: SlideAnimation(
                begin: const Offset(0, 20),
                intervalStart: 0.55,
                child: FadeAnimation(
                  intervalStart: 0.55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Supported By',
                      ),
                      SvgPicture.asset(
                        'assets/images/amazon.svg',
                        width: 24,
                      ),
                      SvgPicture.asset(
                        'assets/images/ethereum.svg',
                        width: 18,
                      ),
                      SvgPicture.asset(
                        'assets/images/polygon.svg',
                        width: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ApplicationBar extends StatelessWidget {
  const _ApplicationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const ApplicationLogo(),
        MaterialButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          color: Colors.lightGreenAccent,
          child: Text(
            'Log out',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class ApplicationLogo extends StatelessWidget {
  const ApplicationLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/oev_logo.png'),
      height: 50,
      width: 50,
    );
  }
}

class AppStat extends StatelessWidget {
  const AppStat({
    Key? key,
    required this.title,
    required this.subtext,
  }) : super(key: key);

  final String title;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          subtext,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}

class EventInfo_1 extends StatelessWidget {
  const EventInfo_1(
      {Key? key,
      required this.eventTime,
      required this.eventDate,
      required this.subtext})
      : super(key: key);

  final String eventTime;
  final String eventDate;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          eventTime,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          eventDate,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          subtext,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}

class EventInfo_2 extends StatelessWidget {
  const EventInfo_2({Key? key, required this.title, required this.subtext})
      : super(key: key);

  final String title;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          subtext,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}
