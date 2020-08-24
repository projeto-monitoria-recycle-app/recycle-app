import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recicle_app/models/onboardingcard.dart';
import 'package:recicle_app/widgets/animated_bouncing_btn.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController;
  int currentPage = 0;
  final int _numPages = cardsList.length;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 16.0 : 8.0,
      decoration: BoxDecoration(
        // color: isActive ? Color(0xFF09995C) : Color(0xFF09995C),
        color: Color(0xFF09995C),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                  'Recycle app',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ),
              Expanded(
                // It will disable the glowing scroll effect
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overScroll) {
                    overScroll.disallowGlow();
                    return false;
                  },
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    children: <Widget>[
                      for (var i = 0; i < cardsList.length; i++)
                        Card(
                            currentPage: i + 1,
                            pageController: _pageController,
                            lastPage: _numPages,
                            text: cardsList[i].text),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
              currentPage == cardsList.length - 1
                  ? AnimatedBouncingButton(
                      text: 'Vamos começar!',
                      onTapFunction: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({this.pageController, this.currentPage, this.lastPage, this.text});

  final String text;
  final PageController pageController;
  final int currentPage;
  final int lastPage;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double value = 1;
              if (pageController.position.haveDimensions) {
                value = pageController.page - currentPage;
                value = ((value.abs() * 0.6)).clamp(0.0, 1.0);
              }
              return Container(
                color: currentPage == 0 ? Colors.blue : Colors.white,
                child: Center(
                  child: Image.asset(
                    'assets/img/onBoardingImg-0$currentPage.png',
                    height: screenHeight * 0.8 * value,
                  ),
                ),
              );
            },
          ),
        ),
        AnimatedBuilder(
          animation: pageController,
          builder: (context, child) {
            double value = 1;
            double opacity = 1;
            if (pageController.position.haveDimensions) {
              value = pageController.page - currentPage;
              opacity = (1 + (value + 1));
              if (opacity > 1) {
                opacity = (1 - (value + 1));
              }
              print('opacity $opacity');

              return Text(
                text,
                style: TextStyle(
                  color: Color(0xffD9333333).withOpacity(opacity),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              );
            }
          },
        ),
      ],
    );
  }
}
