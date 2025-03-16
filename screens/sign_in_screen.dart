import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'sign_up_screen.dart'; // import sign_up_screen.dart
import 'package:t/screens/home_page.dart'; // import home_page.dart

/* Authored by: Selwyn  Duro
Company: Company Name
Project: E-WAY
Feature: [EW-003] Create Account
The Create Account page allows users to register on the platform or using their email or third-party authentication methods such as Google and Facebook.
 */



class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> { // Add _SignInScreenState class
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Stack(
        children: [

          Row( // Add Row widget
            children: [ // add image to the left side of the screen
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.green[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('lib/assets/images/image_1.png', width: 706, height: 485),
                    ],
                  ),
                ),
              ),
              Expanded( // Add Expanded widget
                flex: 3,
                child: Container( //
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row( // Add Row widget
                    children: [
                      const Spacer(flex: 3),
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [ 
                                const Text( // Add Text widget sign in
                                  'Sign In',
                                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon( // Add google ElevatedButton.icon widget 
                                        onPressed: () {},
                                        icon: const Icon(Icons.g_translate),
                                        label: const Text('Sign Up With Google'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          side: const BorderSide(color: Color(0xFFD3D3D3)),
                                          textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ElevatedButton.icon( // Add facebook ElevatedButton.icon widget
                                        onPressed: () {},
                                        icon: const Icon(Icons.facebook, color: Colors.blue),
                                        label: const Text('Sign Up With Facebook'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          side: const BorderSide(color: Color(0xFFD3D3D3)),
                                          textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const Center(child: Text('- OR -', style: TextStyle(color: Colors.grey))),
                                const SizedBox(height: 20),
                                const TextField( // Add TextField widget for email address
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    labelText: 'Email Address',
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD3D3D3)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField( // Add TextField widget for password
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton( // Add IconButton widget for visibility
                                      icon: Icon(
                                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible = !_isPasswordVisible;
                                        });
                                      },
                                    ),
                                    labelText: 'Password',
                                    border: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD3D3D3)),
                                    ),
                                  ),
                                  obscureText: !_isPasswordVisible,
                                ),
                                const SizedBox(height: 10),
                                Row( // Add Row widget for remember me and forgot password
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(// Add Checkbox widget for remember me
                                          value: false,
                                          onChanged: (bool? value) {},
                                        ),
                                        const Text('Remember me'),
                                      ],
                                    ),
                                    TextButton( // Add TextButton widget for forgot password
                                      onPressed: () {},
                                      child: const Text('Forgot password?'),
                                      style: TextButton.styleFrom(
                                        foregroundColor: Color(0xFF92CBCE), // Set the text color here
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Align( // Add Align widget for sign in button
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF8DDAB2),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                      ),
                                      child: const Text(
                                        'Sign In',
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row( // Add Row widget for sign up
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Don\'t have an account yet? '),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Sign Up',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF92CBCE),
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SignUpScreen()),
                                            );
                                          },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10, // Adjusted position
            left: 65, // Adjusted position
            child: GestureDetector( // Add GestureDetector widget when  logo is tapped it will navigate to HomePage
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Image.asset('lib/assets/images/logo.png', width: 200, height: 150), // Add Image widget for logo
            ),
          ),
        ],
      ),
    );
  }
}