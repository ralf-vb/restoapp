import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'cart.dart';

class appetizer extends StatefulWidget {
  const appetizer({Key? key}) : super(key: key);

  @override
  _appetizerState createState() => _appetizerState();
}

class _appetizerState extends State<appetizer> {
  int _currentIndex = 0;
  int _quantity = 1;
  CarouselController _carouselController = CarouselController();
  List<Map<String, dynamic>> cartItems = [];

  final List<Map<String, dynamic>> items = [
    {
      'imagePath': 'assets/images/appetizer1.jpeg',
      'text': 'Onion Rings',
      'price': '\₱150.00',
      'details': 'Onion rings with served dipping ketchup',
    },
    {
      'imagePath': 'assets/images/appetizer2.jpeg',
      'text': 'Spring rolls',
      'price': '\₱100.00',
      'details': 'Spring rolls served with dipping sauce',
    },
    {
      'imagePath': 'assets/images/appetizer3.jpeg',
      'text': 'Crunchy Corndog',
      'price': '\₱200.00',
      'details': 'A hot dog-style sausage coated in a sweet and savory batter,',
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

  void addToCart(int quantity) {
    final selectedItem = items[_currentIndex];
    final itemToAdd = {
      'item': selectedItem,
      'quantity': quantity,
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
      appBar: AppBar(
        title: const Text('Appetizer'),
        backgroundColor: Colors.blue[100],
      ),
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
              const SizedBox(height: 100),
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
                      onPressed: () {
                        addToCart(_quantity);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Cart(cartItems: cartItems),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Cart extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const Cart({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  void removeFromCart(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index]['item'] as Map<String, dynamic>;
          final quantity = widget.cartItems[index]['quantity'] as int;

          return ListTile(
            leading: Image.asset(
              item['imagePath'],
              width: 50,
              height: 50,
            ),
            title: Text(item['text']),
            subtitle: Text('Quantity: $quantity'),
            trailing: IconButton(
              onPressed: () => removeFromCart(index),
              icon: Icon(Icons.remove_shopping_cart),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: appetizer(),
  ));
}
