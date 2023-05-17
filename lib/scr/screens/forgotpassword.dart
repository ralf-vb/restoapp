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
      body: FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pbackground2.jpeg'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                title: const Text('Forgot Password'),
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 200.0),
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
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(250, 50), // Set the desired button size
                          backgroundColor: Colors.blue, // Set the desired background color
                        ),
                        child: const Text(
                          'Forgot',
                          style: TextStyle(fontSize: 16.0, color: Colors.white), // Set the desired text size and color
                        ),
                      ),

                    ],
                  ),
                ),
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