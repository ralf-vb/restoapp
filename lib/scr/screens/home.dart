import 'package:flutter/material.dart';
import 'package:restoapp/scr/screens/aboutus.dart';
import 'package:restoapp/scr/screens/appetizer.dart';
import 'package:restoapp/scr/screens/cart.dart';
import 'package:restoapp/scr/screens/dessert.dart';
import 'package:restoapp/scr/screens/drinks.dart';
import 'package:restoapp/scr/screens/maincourse.dart';
import '../screens/loginpage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue[100],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[100],
              ),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Cart'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => cart()));
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => aboutus()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => loginpage()));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "What would you like to eat?",
                    style: TextStyle(
                        fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.notifications_none),
                      onPressed: () {},
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.search, color: Colors.red),
                  title: const TextField(
                    decoration: InputDecoration(
                      hintText: "Find food and restaurants",
                      border: InputBorder.none,
                    ),
                  ),
                  trailing: const Icon(Icons.filter_list, color: Colors.red),
                ),
              ),
            ),

            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => appetizer()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/appetizer.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Appetizer',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => dessert()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/dessert.jpg',
                          width: 100,
                          height: 100,
                          // fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Dessert',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => maincourse()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/fullcourse.jpeg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Main Course',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => drinks()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/drinks.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Drinks',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                "Popular",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
              ),
              items: [
                {
                  'imagePath': 'assets/images/appetizer1.jpeg',
                  'text': 'Onion Rings',
                  'price': '\₱150.00',
                  'details': 'Onion rings with served dipping ketchup',
                },

                {
                  'imagePath': 'assets/images/desert 1.jpeg',
                  'text': 'Black Forest Cake',
                  'price': '\₱450.00',
                  'details': 'Cake sandwiched with whipped cream and cherries',
                },
                {
                  'imagePath': 'assets/images/drinks3.jpeg',
                  'text': 'Coffee Iced latte',
                  'price': '\₱100.00',
                  'details': 'A single or double shot of espresso ',
                },
                {
                  'imagePath': 'assets/images/maincourse3.jpg',
                  'text': 'Chicken Afritada',
                  'price': '\₱100.00',
                  'details': 'Made with chicken in tomato sauce with potatoes,carrots and bell peppers',
                },
                // Add more items...
              ].map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['text']!,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    item['details']!,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    'Price: ${item['price']}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add logic for button press
                                    },
                                    child: Text('Add to Cart'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(item['imagePath']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item['text']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item['price']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),



          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String image;
  final String label;

  const CategoryButton({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Handle category button tap
            // You can navigate to a specific category or perform any other action
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue, // You can customize the button's color here
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}