import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class drinks extends StatelessWidget {
  drinks({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> drinksList = [
    {
      'imagePath': 'assets/images/drinks1.jpeg',
      'name': 'Drink 1',
      'price': '\$5.99',
    },
    {
      'imagePath': 'assets/images/drinks2.jpeg',
      'name': 'Drink 2',
      'price': '\$4.99',
    },
    {
      'imagePath': 'assets/images/drinks3.jpeg',
      'name': 'Drink 3',
      'price': '\$6.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 300.0),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
          ),
          items: drinksList.map((drink) {
            return Column(
              children: [
                Image.asset(
                  drink['imagePath'],
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  drink['name'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  drink['price'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
