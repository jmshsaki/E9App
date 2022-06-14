import 'package:carousel_slider/carousel_slider.dart';
import 'package:e9care/Config/constant.dart';
import 'package:e9care/Models/banner_slider_model.dart';
import 'package:e9care/Models/cache_image_network.dart';
import 'package:e9care/Screens/Ambulance/ambulance.dart';
import 'package:e9care/Screens/EventManagement/eventmanagement_screen.dart';
import 'package:e9care/Screens/HomeTutor/Hometutor.dart';
import 'package:e9care/Screens/Parlour/parlour_screen.dart';
import 'package:e9care/Screens/Rentacar/Rentacar.dart';
import 'package:e9care/Screens/hospital_doctors_location.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentImageSlider = 0;
  final List<BannerSliderModel> _bannerData = [];

  @override
  void initState() {
    _bannerData.add(BannerSliderModel(
        id: 1, image: GLOBAL_URL + '/assets/images/home_banner/1.jpg'));
    _bannerData.add(BannerSliderModel(
        id: 2, image: GLOBAL_URL + '/assets/images/home_banner/2.jpg'));
    _bannerData.add(BannerSliderModel(
        id: 3, image: GLOBAL_URL + '/assets/images/home_banner/3.jpg'));
    _bannerData.add(BannerSliderModel(
        id: 4, image: GLOBAL_URL + '/assets/images/home_banner/4.jpg'));
    _bannerData.add(BannerSliderModel(
        id: 5, image: GLOBAL_URL + '/assets/images/home_banner/5.jpg'));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ///Slider Stars here
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Stack(
                      children: [
                        CarouselSlider(
                          items: _bannerData
                              .map((item) => GestureDetector(
                                  onTap: () {
                                    Fluttertoast.showToast(
                                        msg: 'Click banner ' +
                                            item.id.toString(),
                                        toastLength: Toast.LENGTH_SHORT);
                                  },
                                  child: buildCacheNetworkImage(
                                      width: 0, height: 0, url: item.image)))
                              .toList(),
                          options: CarouselOptions(
                              aspectRatio: 2,
                              viewportFraction: 1.0,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 6),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 300),
                              enlargeCenterPage: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentImageSlider = index;
                                });
                              }),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _bannerData.map((item) {
                              int index = _bannerData.indexOf(item);
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                width: _currentImageSlider == index ? 10 : 5,
                                height: _currentImageSlider == index ? 10 : 5,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Ink.image(
              height: 70,
              image: AssetImage('assets/logo.png'),
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 30),
            Text(
              "ই-নাইন কেয়ার - জীবনের প্রতি যত্নশীল",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),

            ///1st line cards
            Row(children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green.shade300,
                            Colors.green.shade800,
                          ]),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(18)),
                  height: 55,
                  margin: const EdgeInsets.all(2.0),
                  child: TextButton.icon(
                    icon: const Icon(Icons.hotel_sharp),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HospitalDoctorsLocation()),
                      );
                    },
                    label: const Center(
                      child: Text(
                        'Hospital',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green.shade300,
                            Colors.green.shade800,
                          ]),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(18)),
                  height: 55,
                  margin: const EdgeInsets.all(2.0),
                  child: TextButton.icon(
                    icon: const Icon(Icons.verified_user),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      /// Please add related files at PrivateDoctor folder

                      Fluttertoast.showToast(
                          msg: "Coming Soon",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    label: const Center(
                        child: Text(
                      'Private Doctors',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green.shade300,
                            Colors.green.shade800,
                          ]),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(18)),
                  height: 55,
                  margin: const EdgeInsets.all(2.0),
                  child: TextButton.icon(
                    icon: const Icon(Icons.panorama_fish_eye),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Coming Soon",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => EyeDentalScreen()),
                      // );
                    },
                    label: const Center(
                        child: Text(
                      'Eye and Dental Zone',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 10),

            ///2nd line cards
            Row(children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green.shade300,
                            Colors.green.shade800,
                          ]),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(18)),
                  height: 55,
                  margin: const EdgeInsets.all(2.0),
                  child: TextButton.icon(
                    icon: const Icon(Icons.directions_car),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ambulance()),
                      );
                    },
                    label: const Center(
                        child: Text(
                      'Ambulance',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green.shade300,
                            Colors.green.shade800,
                          ]),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(18)),
                  height: 55,
                  margin: const EdgeInsets.all(2.0),
                  child: TextButton.icon(
                    icon: const Icon(Icons.car_rental_rounded),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Rentacar()),
                      );
                    },
                    label: const Center(
                        child: Text(
                      'Rent-A-Car',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green.shade300,
                            Colors.green.shade800,
                          ]),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(18)),
                  height: 55,
                  margin: const EdgeInsets.all(2.0),
                  child: TextButton.icon(
                    icon: const Icon(Icons.school),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Hometutor()),
                      );
                    },
                    label: const Center(
                        child: Text(
                      'Home Tutor',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 10),

            ///3d line cards
            Row(children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green.shade300,
                            Colors.green.shade800,
                          ]),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(18)),
                  height: 55,
                  margin: const EdgeInsets.all(2.0),
                  child: TextButton.icon(
                    icon: const Icon(Icons.event),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventmanagementScreen()),
                      );
                    },
                    label: const Center(
                        child: Text(
                      'Event Management',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green.shade300,
                            Colors.green.shade800,
                          ]),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(18)),
                  height: 55,
                  margin: const EdgeInsets.all(2.0),
                  child: TextButton.icon(
                    icon: const Icon(Icons.girl_rounded),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParlourScreen()),
                      );
                    },
                    label: const Center(
                        child: Text(
                      'Beauty Parlour',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green.shade300,
                            Colors.green.shade800,
                          ]),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(18)),
                  height: 55,
                  margin: const EdgeInsets.all(2.0),
                  child: const Center(
                    child: Text(
                      "Coming Soon!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ));
  }
}
