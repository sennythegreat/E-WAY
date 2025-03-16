import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScrollSection extends StatefulWidget {
  @override
  _ScrollSectionState createState() => _ScrollSectionState();
}

class _ScrollSectionState extends State<ScrollSection> {
  final PageController _pageController = PageController(viewportFraction: 0.6, initialPage: 1000);
  int _currentPage = 1000;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int nextPage = _pageController.page!.round();
      if (_currentPage != nextPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  void _goToPreviousPage() {
    _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _goToNextPage() {
    _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 850,
            child: Column(
              children: [
                Text(
                  'Browse Latest Models',
                  style: GoogleFonts.sofiaSansCondensed(
                    fontSize: 100,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF003E1F),
                  ),
                ),
                SizedBox(height: 100),
                Stack(
                  children: [
                    Container(
                      height: 450,
                      child: PageView.builder(
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          int actualIndex = index % 5; // Assuming you have 5 items
                          return _buildCard(
                            actualIndex == 0 ? 'Mini ECar' : actualIndex == 1 ? 'ERV S3' : actualIndex == 2 ? 'ERV' : 'Angel',
                            actualIndex == 0 ? 'Php150,000' : actualIndex == 1 ? 'Php59,800' : actualIndex == 2 ? 'Php36,000' : 'Php63,200',
                            'lib/assets/images/ebike1.png',
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, size: 30),
                        onPressed: _goToPreviousPage,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward, size: 30),
                        onPressed: _goToNextPage,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Show More" action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004D40),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Show More',
                    style: GoogleFonts.sofiaSansCondensed(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          _buildExploreOtherFeaturesSection(),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String price, String imagePath) {
    return Container(
      width: 0, // Adjusted width
      height: 250, // Adjusted height
      margin: EdgeInsets.symmetric(horizontal: 60), // Adjusted margin
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15), // Adjusted border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 400, // Adjusted width
            height: 350, // Adjusted height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // Adjusted border radius
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title, style: GoogleFonts.sofiaSansCondensed(fontSize: 20, fontWeight: FontWeight.w500)), // Adjusted font size
                SizedBox(height: 5),
                Text(price, style: GoogleFonts.sofiaSansCondensed(fontSize: 10, fontWeight: FontWeight.w300, color: Colors.green)), // Adjusted font size
                SizedBox(height: 5),
                Text('NWOW', style: GoogleFonts.sofiaSansCondensed(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey)), // Adjusted font size
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreOtherFeaturesSection() {
    return Container(
      height: 800, // Set a fixed height
      padding: EdgeInsets.symmetric(vertical: 50), // Add padding
      margin: EdgeInsets.only(top: 20), // Add margin to separate from the previous section
      child: Column(
        children: [
          Text(
            'Explore other Features',
            style: GoogleFonts.sofiaSansCondensed(
              fontSize: 80,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF003E1F),
            ),
          ),
          SizedBox(height: 50), // Added height
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFeatureCard(
                'E-Bike Registration Guide',
                'This guide provides a step-by-step process for registering your E-Bike at city hall, including required documents, fees, and important regulations to ensure a hassle-free registration experience.',
                'lib/assets/images/Registration Img.png',
              ),
              _buildFeatureCard(
                'Safety and Traffic Guidelines',
                'Learn the most important regulations all drivers must know. All rules and regulations presented in this guide is created and managed by the Land Transportation Office (LTO) of the Philippines.',
                'lib/assets/images/image 19.png',
              ),
              _buildFeatureCard(
                'E-Bike Maintenance Guide',
                'Check all your essential vehicle components, including battery charging, tire checks, and also servicing. Promote vehicle reliability and prevent breakdowns of your E-Bike.',
                'lib/assets/images/image 20.png',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String description, String imagePath) {
    return Container(
      width: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.sofiaSansCondensed(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.sofiaSansCondensed(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Learn more →',
            style: GoogleFonts.sofiaSansCondensed(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}