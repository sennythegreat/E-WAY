import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';
import 'sign_in_screen.dart';

class CustomNavbar extends StatefulWidget {
  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  Color _navbarColor = Colors.white;

  Widget _buildNavItem(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: () {
          // Handle navigation
        },
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
      color: _navbarColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Image.asset('lib/assets/images/logo.png', width: 200, height: 120),
            ),
          ),
          Spacer(),
          _buildNavItem(context, 'Home'),
          _buildNavItem(context, 'Showcase'),
          _buildNavItem(context, 'Registration'),
          _buildNavItem(context, 'Regulations'),
          _buildNavItem(context, 'Maintenance'),
          SizedBox(width: 60),
          ElevatedButton(
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
            child: Text(
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
    );
  }
}

class RegistrationGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the registration guide page.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}