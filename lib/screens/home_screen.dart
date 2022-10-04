import 'package:flutter/material.dart';
import 'ticket_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oev_v03/animations/page_transition.dart';
import 'package:oev_v03/animations/slide_animation.dart';
import 'package:oev_v03/screens/launch_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final double _padding = 24;
  //late PageController _pageController;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
  }

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
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: const _Title(),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: const SlideAnimation(child: _CategoryTabs()),
            ),
            SizedBox(height: 15),
            SlideAnimation(
              begin: Offset(400, 0),
              child: SizedBox(
                height: 370,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const TicketScreen(),
                            type: PageTransitionType.fadeIn,
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'AWS Training.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  /* Text(
                                    '20th Oct 2022',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ), */
                                  const Spacer(),
                                  Text(
                                    '@AWS',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Hero(
                                tag: '$index',
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Theme.of(context).primaryColor,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        index % 2 == 0
                                            ? 'assets/images/aws.jpg'
                                            : 'assets/images/aws-2.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  EventInfo_1(
                                    eventTime: '10:30 am',
                                    eventDate: '7th Oct 2022',
                                    subtext: 'Event Time',
                                  ),
                                  EventInfo_2(
                                    title: '2 OEV Coins',
                                    subtext: 'Ticket Price',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        iconSize: 24,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.home_15, isActive: true),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.discover_1),
            label: 'Discovery',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.add_square),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.wallet_3),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  const BottomIcon({Key? key, required this.icon, this.isActive = false})
      : super(key: key);

  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Divider(
          color: isActive ? Colors.black : Colors.transparent,
          thickness: 2,
          indent: 25,
          endIndent: 25,
        )
      ],
    );
  }
}

class _CategoryTabs extends StatelessWidget {
  const _CategoryTabs({Key? key}) : super(key: key);

  final List<String> _options = const [
    'Popular',
    'Trainings',
    'Seminars',
    'Conferences',
    'Meetings'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _options.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: index == 0 ? Colors.black : null,
            ),
            padding: EdgeInsets.only(
              left: 22,
              right: index == 0 ? 22 : 0,
            ),
            child: Center(
              child: Text(
                _options[index],
                style: TextStyle(
                  fontSize: 14,
                  color: index == 0 ? Colors.white : Colors.black54,
                  fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //SizedBox(height: 1),
            Text(
              'Buy Tickets',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            SizedBox(height: 3),
            Text(
              'Buy tickets for your favorite events',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              //style: bodyTextStyle,
            ),
          ],
        ),
        const Icon(Iconsax.setting_5),
      ],
    );
  }
}

class _ApplicationBar extends StatelessWidget {
  const _ApplicationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ApplicationLogo(),
        Container(
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/profile_1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
