import 'package:flutter/material.dart';

class cart extends StatelessWidget {
  const cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blue[100],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset(
              'assets/images/food1.jpeg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text('Food Item 1'),
            subtitle: Text('Price: \$10.99'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                // Remove item from cart
              },
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/food2.jpeg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text('Food Item 2'),
            subtitle: Text('Price: \$8.99'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                // Remove item from cart
              },
            ),
          ),
          // Add more ListTile widgets for each item in the cart
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Place order logic
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            primary: Colors.blue,
          ),
          child: Text(
            'Place Order',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

