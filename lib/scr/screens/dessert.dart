import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'cart.dart';

class dessert extends StatefulWidget {
  const dessert({Key? key}) : super(key: key);

  @override
  _dessertState createState() => _dessertState();
}

class _dessertState extends State<dessert> {
  int _currentIndex = 0;
  int _quantity = 1;
  CarouselController _carouselController = CarouselController();
  List<Map<String, dynamic>> cartItems = [];

  final List<Map<String, dynamic>> items = [
    {
      'imagePath': 'assets/images/desert 1.jpeg',
      'text': 'Black Forest Cake',
      'price': '\₱450.00',
      'details': 'Cake sandwiched with whipped cream and cherries',
    },
    {
      'imagePath': 'assets/images/desert 2.jpeg',
      'text': 'Chocolate Ice Cream',
      'price': '\₱150.00',
      'details':
      'Melted chocolate, and sugar flavored with cocoa powder and additional mix-ins.',
    },
    {
      'imagePath': 'assets/images/desert3.jpeg',
      'text': 'Assorted Donuts',
      'price': '\₱300.00',
      'details': 'Delicious yeast donuts coated with sweet glaze.,',
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

  void addToCart() {
    final selectedItem = items[_currentIndex];
    final itemToAdd = {
      'item': selectedItem,
      'quantity': _quantity,
    };
    setState(() {
      cartItems.add(itemToAdd);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${selectedItem['text']} added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/pbackground2.jpeg',
            ),
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
                  autoPlayInterval: Duration(seconds: 5),
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
                            image: AssetImage(item['imagePath']),
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
                color: Colors.blue[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[_currentIndex]['text'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      items[_currentIndex]['details'],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Price: ${items[_currentIndex]['price']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Text(
                          'Quantity:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 8.0),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (_quantity > 1) {
                                _quantity--;
                              }
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(
                          '$_quantity',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: addToCart,
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

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Cart Items:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  return ListTile(
                    leading: Image.asset(
                      item['item']['imagePath'],
                      width: 50,
                      height: 50,
                    ),
                    title: Text(item['item']['text']),
                    subtitle: Text('Quantity: ${item['quantity']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: dessert(),
  ));
}
