import 'package:flutter/material.dart';

class aboutus extends StatelessWidget {
  const aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.blue[100],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/projectlogo.png',
              width: 120,
              height: 120,
            ),
            SizedBox(height: 16.0),
            Text(
              'Phoenix Fast Delivery',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Phoenix Fast Delivery is a leading delivery service provider committed to delivering your packages quickly and efficiently. We strive to provide a seamless delivery experience, ensuring your items reach their destination on time and in perfect condition.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact us:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Phone: +1 123-456-7890',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Email: info@phoenixdelivery.com',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

