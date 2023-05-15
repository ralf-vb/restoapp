import 'package:flutter/material.dart';
import '../screens/loginpage.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  _forgotpasswordState createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  final _formKey = GlobalKey<FormState>();

  String? _email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100], // Set your desired background color here
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        TextFormField(
        decoration: InputDecoration(
        labelText: 'Email',
          prefixIcon: Icon(Icons.email),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          if (!isValidEmail(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
        onSaved: (value) {
          _email = value;
        },
          ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Perform login logic here using _email and _password
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginpage()),
                  );
                }
              },
              child: const Text('Forgot'),
            ),
        ],
       ),
      ),
      ),
    );
  }

  bool isValidEmail(String email) {
    // Perform your email validation here
    // You can use regular expressions or any other method
    // to validate the email format
    // For simplicity, this example checks if the email contains '@' symbol
    return email.contains('@');
  }
}
