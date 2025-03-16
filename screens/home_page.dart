import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t/screens/homepage_scroll_section.dart'; // import path of the ScrollSection widget
import 'package:t/screens/sign_in_screen.dart'; // Import sign up screen
import 'package:t/screens/registration.dart';  // Import registration screen


/* Authored by: Selwyn  Duro
Company: Company Name
Project: E-WAY
Feature: EW-001 [EW-001] Homepage (Without Account)
The homepage provides an overview of the latest e-bike models, safety guidelines, and maintenance resources without requiring users to log in. It allows visitors to explore key features of the platform before creating an account.
 */


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState(); // Create a state for the homepage
}

class _HomePageState extends State<HomePage> { // Add a stateful widget for the homepage
  final ScrollController _scrollController = ScrollController();
  Color _navbarColor = Colors.transparent; // Set the initial color of the navigation bar to transparent
 


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() { // Listen for scroll events
      setState(() {
        _navbarColor = _scrollController.offset > 50 ? const Color(0xFFD5F2E3).withOpacity(0.8) : Colors.transparent;
      });
    });
  }

  @override
  void dispose() { // Dispose of the scroll controller
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView( // Use a SingleChildScrollView widget
            controller: _scrollController,
            child: Column(
              children: [
                Container( // Add a container to hold the gradient background
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFE0B2), Color(0xFFB2DFDB)], // Lighter colors
                      stops: [0.0, 1.0],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column( // Add a column to hold the content
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              top: 60,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 100.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [ // Add a text span for the title
                                                TextSpan(
                                                  text: 'Ride Smarter,',
                                                  style: GoogleFonts.tiltWarp(
                                                    fontSize: 115,
                                                    color: const Color(0xFF003E1F),
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                                TextSpan( 
                                                  text: '\nRide Safer.',
                                                  style: GoogleFonts.tiltWarp(
                                                    fontSize: 115,
                                                    color: const Color(0xFF003E1F),
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton( // Add an elevated button for Gert Started action scrolling to the next section
                                            onPressed: () {
                                              _scrollController.animateTo(
                                                MediaQuery.of(context).size.height - 140, // Adjust scroll position
                                                duration: Duration(seconds: 1),
                                                curve: Curves.easeInOut,
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(0xFFBA2D0B),
                                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                            ),
                                            child: Text(
                                              'Get Started',
                                              style: GoogleFonts.sofiaSansCondensed(
                                                fontSize: 24,
                                                color: const Color.fromARGB(255, 255, 255, 255),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded( 
                                    flex: 1,
                                    child: Padding( // Add padding to the image
                                      padding: const EdgeInsets.only(right: 100, top: 70),
                                      child: Image.asset('lib/assets/images/ebike1.png', width: 1000, height: 1100),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ScrollSection(), // Use the ScrollSection widget here
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned( // Add a positioned widget for the navigation bar
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer( // Use an AnimatedContainer widget for the navigation bar
              duration: Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0), // Adjusted padding
              color: _navbarColor, // Adaptable background color
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [ // Add navigation items
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()), // Add navigation to the Home screen
                        );
                      },
                      child: Image.asset('lib/assets/images/logo.png', width: 200, height: 120), // Adjusted image size and image path
                    ),
                  ),
                  Spacer(), // Add a spacer widget to push the navigation items to the right
                  _buildNavItem('Home'),
                  _buildNavItem('Showcase'),
                  _buildNavItem('Registration'),
                  _buildNavItem('Regulations'),
                  _buildNavItem('Maintenance'),
                  SizedBox(width: 60),
                  ElevatedButton( // Add an elevated button for the Sign In action to navigate to the Sign In screen
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE0F2F1),
                      foregroundColor: Color(0xFF004D40),
                      side: BorderSide(color: Color(0xFF004D40)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text( // Add a text widget for the Sign In button
                      'Sign In',
                      style: GoogleFonts.sofiaSansCondensed(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildNavItem(String title) { // Add a function to build navigation items
  return Padding(
    padding: const EdgeInsets.only(right: 25.0),
    child: GestureDetector(
      onTap: () {
        if (title == 'Home') { // Add navigation for Home screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (title == 'Registration') { // Add navigation for Registration screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistrationGuide()),
          );
        } else if (title == 'Showcase') {
          // Add navigation for Showcase screen
        } else if (title == 'Regulations') {
          // Add navigation for Regulations screen
        } else if (title == 'Maintenance') {
          // Add navigation for Maintenance screen
        }
      },
      child: Text( // Add text widget for the navigation item
        title,
        style: GoogleFonts.sofiaSansCondensed(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  );
}



}