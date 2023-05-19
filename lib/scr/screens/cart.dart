import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, String> item, int quantity) {
    setState(() {
      cartItems.add({
        'item': item,
        'quantity': quantity,
      });
    });
  }

  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index]['item'] as Map<String, String>;
          final quantity = cartItems[index]['quantity'] as int;

          return ListTile(
            leading: Image.asset(
              item['imagePath']!,
              width: 50,
              height: 50,
            ),
            title: Text(item['text']!),
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

