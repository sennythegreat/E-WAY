import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'sign_in_screen.dart'; // Add this import
import 'package:t/screens/home_page.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Row(
            children: [
              Expanded(
                flex: 3, // Increase the flex value of the left section
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
              Expanded(
                flex: 3, // Decrease the flex value of the right section
                child: Container(
                  padding: const EdgeInsets.only(left: 20), // Move the section to the right
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Spacer(flex: 3), // Add a Spacer to the left
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(20), // Adjust the padding here
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Create Account',
                                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.g_translate),
                                        label: const Text('Sign Up With Google'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          side: const BorderSide(color: Color(0xFFD3D3D3)), // Set the border color here
                                          textStyle: const TextStyle(
                                            fontSize: 15, // Set the font size here
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400, // Set the font weight to regular
                                          ),
                                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Adjust the padding here
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.facebook, color: Colors.blue),
                                        label: const Text('Sign Up With Facebook'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          side: const BorderSide(color: Color(0xFFD3D3D3)), // Set the border color here
                                          textStyle: const TextStyle(
                                            fontSize: 15, // Set the font size here
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400, // Set the font weight to regular
                                          ),
                                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Adjust the padding here
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const Center(child: Text('- OR -', style: TextStyle(color: Colors.grey))),
                                const SizedBox(height: 20),
                                const TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    labelText: 'Full Name',
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD3D3D3)), // Use lighter underline border
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    labelText: 'Email Address',
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD3D3D3)), // Use lighter underline border
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
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
                                      borderSide: BorderSide(color: Color(0xFFD3D3D3)), // Use lighter underline border
                                    ),
                                  ),
                                  obscureText: !_isPasswordVisible,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isChecked = value!;
                                        });
                                      },
                                    ),
                                    const Text('I agree with '),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Privacy Policy',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF92CBCE),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle Privacy Policy tap
                                          },
                                        children: [
                                          const TextSpan(
                                            text: ' and ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Terms of Use',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF92CBCE),
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // Handle Terms of Use tap
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF8DDAB2), // Set the button color here
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        padding: const EdgeInsets.symmetric(vertical: 16), // Adjust the padding here
                                      ),
                                      child: const Text(
                                        'Create Account',
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already have an account? '),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Log in',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF92CBCE), // Set the color to #92CBCE
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SignInScreen()),
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
                      const Spacer(flex: 3), // Add a Spacer to the right
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10, // Adjusted position
            left: 65, // Adjusted position
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Image.asset('lib/assets/images/logo.png', width: 200, height: 150),
            ),
          ),
        ],
      ),
    );
  }
}