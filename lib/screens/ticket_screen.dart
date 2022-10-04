import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oev_v03/animations/fade_animation.dart';
import 'package:oev_v03/animations/slide_animation.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45),
              const _ApplicationBar(),
              SizedBox(height: 35),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black26),
                ),
                child: Hero(
                  tag: '1',
                  child: Image.asset('assets/images/aws.jpg',
                      height: 280, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 18),
              SlideAnimation(
                intervalStart: 0.55,
                begin: const Offset(0, 30),
                child: FadeAnimation(
                  intervalStart: 0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'AWS Training',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              //'assets/images/profile_2.jpg',
                              'assets/images/aws.png',
                              fit: BoxFit.cover,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(width: 8),
                          const Text(
                            '@AWS',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Description: A training about AWS products',
                      ),
                      SizedBox(height: 8),
                      //const Divider(),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('assets/images/profile_3.jpg',
                              height: 40, width: 40, fit: BoxFit.cover),
                        ),
                        title: const Text('Ticket on Sale By'),
                        subtitle: Text(
                          'Alice',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14),
                        ),
                        trailing: Text(
                          '\t\t\t 2.0 OEV Coins \n 7th Oct 2022, 6:30 PM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      const BuyButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyButton extends StatelessWidget {
  const BuyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t'
                'Buy Ticket',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ApplicationBar extends StatelessWidget {
  const _ApplicationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        SizedBox(width: 18),
        Text(
          'Back to Homepage',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Spacer(),
        const Icon(Iconsax.add_circle, color: Colors.black),
        SizedBox(width: 14),
        const Icon(Iconsax.menu_1),
      ],
    );
  }
}
