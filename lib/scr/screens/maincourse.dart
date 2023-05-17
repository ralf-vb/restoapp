import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class maincourse extends StatelessWidget {
  const maincourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 300.0),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200, // Adjust the height as needed
            aspectRatio: 3 / 2, // Adjust the aspect ratio as needed
            viewportFraction: 0.8, // Adjust the fraction of the viewport you want to show
            initialPage: 0, // Set the initial page
            enableInfiniteScroll: true, // Set to false if you don't want infinite scrolling
            autoPlay: true, // Set to true for automatic sliding
            autoPlayInterval: Duration(seconds: 3), // Adjust the interval between slides
            autoPlayAnimationDuration: Duration(milliseconds: 800), // Adjust the animation duration
            autoPlayCurve: Curves.fastOutSlowIn, // Adjust the animation curve
            enlargeCenterPage: true, // Set to true if you want the center item to be larger
          ),
          items: [
            // Replace the Placeholder widgets with your own images
            Image.asset(
              'assets/images/maincourse1.jpeg',
              height: 300, // Adjust the height of the image
              width: 400, // Adjust the width of the image
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/maincourse2.jpeg',
              height: 300, // Adjust the height of the image
              width: 400, // Adjust the width of the image
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/maincourse3.jpg',
              height: 300, // Adjust the height of the image
              width: 400, // Adjust the width of the image
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
