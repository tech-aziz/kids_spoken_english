import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kids_spoken_english/views/BottomNavBarScreens/rate_us_screen.dart';
import 'package:kids_spoken_english/views/BottomNavBarScreens/share_screen.dart';
import 'package:kids_spoken_english/views/BottomNavBarScreens/update_screen.dart';

import '../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [RateUsScreen(), ShareScreen(), UpdateScreen()];
  int selectedPageIndex = 0;
  final items = [
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: .8, color: Colors.green),
          image: const DecorationImage(
            image: AssetImage('assets/images/slider_image7.jpg'),
            fit: BoxFit.cover,
          )),
    ),
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: .8, color: Colors.green),
          image: const DecorationImage(
            image: AssetImage('assets/images/slider_image5.jpg'),
            fit: BoxFit.cover,
          )),
    ),
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.8, color: Colors.green),
          image: const DecorationImage(
            image: AssetImage('assets/images/slider_image3.jpg'),
            fit: BoxFit.cover,
          )),
    ),
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: .8, color: Colors.green),
          image: const DecorationImage(
            image: AssetImage('assets/images/slider_image2.jpg'),
            fit: BoxFit.cover,
          )),
    )
  ];
  final details = [
    {
      "img": "assets/images/slider_image1.jpg",
      "level": "Learn English with\n(Munzereen Shahid)"
    },
    {
      "img": "assets/images/slider_image4.jpg",
      "level": "Learn English with\n(Umme Maisun)"
    },
    {
      "img": "assets/images/slider_image5.jpg",
      "level": "Learn English with\n(Aditi Banerjee)"
    },
    {
      "img": "assets/images/slider_image6.jpg",
      "level": "30 Days English Learn"
    },
    {
      "img": "assets/images/slider_image8.jpg",
      "level": "Spoken English with\n(Shafins)"
    },
    {
      "img": "assets/images/slider_image9.jpg",
      "level": "Spoken English with\n(leena Rais)"
    },
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final orientation =
        MediaQuery.orientationOf(context) == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: orientation ? size.height * 0.2 : size.height * 0.4,
                  width: size.width,
                  child: CarouselSlider(
                      items: items,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      )),
                ),
                CarouselIndicator(
                  activeColor: activeIndicatorColor,
                  color: indicatorColor,
                  count: items.length,
                  index: currentIndex,
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Learn English Easily Step by Step',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    // shrinkWrap: true,
                    // primary: false,

                    physics: const BouncingScrollPhysics(),
                    itemCount: details.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: cardBackground,
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 30,
                                    offset: Offset(28, 28),
                                    color: Color(0x0ffa7a9a))
                              ],
                              // border: Border.all(width: 1, color: Colors.green),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                                child: Image.asset(details[index]['img']!),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    details[index]['level']!,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox()
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: size.height * .18,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 25,
                        crossAxisCount: 2),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: GNav(
              onTabChange: (index) {
                selectedPageIndex = index;
                print(selectedPageIndex);
              },
              backgroundColor: primary,
              gap: 8,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.star,
                  text: 'Rate Us',
                ),
                GButton(
                  icon: Icons.share,
                  text: 'Share',
                ),
                GButton(
                  icon: Icons.update,
                  text: 'Update',
                ),
              ]),
        ),
      ),
    );
  }
}