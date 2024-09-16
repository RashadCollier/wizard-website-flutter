import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:wizard_website/introSection.dart';
import 'package:wizard_website/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _pages = [
    "Rashad",
    "About",
    "Gallery",
    "Contact",
  ];

  final List<String> _backgroundImages = [
    'assets/images/background1.jpg',
    'assets/images/background2.jpg',
    'assets/images/background3.jpg',
    'assets/images/background4.jpg',
  ];

  /*final List<Widget> _moreInformation = [
    '',
    '',
    '',
    '',
  ];*/

  bool _isExpanded = false;
  final PageController _pageController = PageController(viewportFraction: 0.95);

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Transform.translate(
        offset: Offset(0, -25),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_backgroundImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: [
                                  Text(
                                    _pages[index],
                                    style: ThemeText.title,
                                  ),
                                  Text(
                                    _pages[index],
                                    style: TextStyle(
                                        fontSize: 160,
                                        color: Colors.white,
                                        fontFamily: GoogleFonts.sacramento()
                                            .fontFamily),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              index == 0
                                  ? ElevatedButton(
                                      onPressed: () {
                                        _navigateToPage(1);
                                      },
                                      child: Icon(
                                        Icons.arrow_downward_rounded,
                                      ),
                                    )
                                  : ElevatedButton(
                                      onPressed: _toggleContainer,
                                      child: Text(
                                        _isExpanded ? '-' : '+',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: _isExpanded ? 200 : 0,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade800,
                          backgroundBlendMode: BlendMode.color,
                        ),
                        child: _isExpanded ? IntroSection() : null,
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              top: 30,
              left: 10,
              child: PopupMenuButton<int>(
                icon: Icon(Icons.water_drop, color: Colors.white),
                onSelected: (int index) {
                  _navigateToPage(index);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text('Home'),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text('About'),
                    ),
                    PopupMenuItem<int>(
                      value: 2,
                      child: Text('Gallery'),
                    ),
                    PopupMenuItem<int>(
                      value: 3,
                      child: Text('Contact'),
                    ),
                  ];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
