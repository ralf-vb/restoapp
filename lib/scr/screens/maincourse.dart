import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class maincourse extends StatefulWidget {
  const maincourse({Key? key}) : super(key: key);

  @override
  _maincourseState createState() => _maincourseState();
}

class _maincourseState extends State<maincourse> {
  int _currentIndex = 0;
  CarouselController _carouselController = CarouselController();

  final List<Map<String, String>> items = [
    {
      'imagePath': 'assets/images/maincourse1.jpeg',
      'text': 'Menudo',
      'price': '\₱100.00',
      'details': 'Made with pork and sliced liver with carrots and potatoes',
    },
    {
      'imagePath': 'assets/images/maincourse2.jpeg',
      'text': 'Sisig',
      'price': '\₱100.00',
      'details':
          'Made with pork belly with calamansi and onions and chili peppers',
    },
    {
      'imagePath': 'assets/images/maincourse3.jpg',
      'text': 'Chicken Afritada',
      'price': '\₱100.00',
      'details':
          'Made with chicken in tomato sauce with potatoes,carrots and bell peppers,',
    },

    // Add more items...
  ];

  void _nextItem() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % items.length;
    });
  }

  void _previousItem() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/pbackground2.jpeg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dx < 0) {
              // Swipe to the left
              _carouselController.nextPage();
            } else if (details.velocity.pixelsPerSecond.dx > 0) {
              // Swipe to the right
              _carouselController.previousPage();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 250),
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  autoPlayInterval:
                      Duration(seconds: 5), // Adjust the interval as needed
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: items.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(item['imagePath']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.blue[100], // Set the desired background color
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[_currentIndex]['text']!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      items[_currentIndex]['details']!,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Price: ${items[_currentIndex]['price']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Add to cart functionality
                        // Implement the logic for adding the item to the cart
                        // Here, you can update a cart object or perform any other desired action
                        print(
                            'Item added to cart: ${items[_currentIndex]['text']}');
                      },
                      child: Text('Add to Cart'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
