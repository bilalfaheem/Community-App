import 'package:flutter/material.dart';

class MyAnimationWidgett extends StatefulWidget {
  @override
  _MyAnimationWidgettState createState() => _MyAnimationWidgettState();
}

class _MyAnimationWidgettState extends State<MyAnimationWidgett>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationLeft;
  late Animation<Offset> _animationCenterToRight;
  late Animation<Offset> _animationRight;
  late Animation<Offset> _animationCenterToLeft;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller with a duration of 1 second
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Define the animations for the left, centerToRight, right, and centerToLeft images
    _animationLeft = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(-1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _animationCenterToRight = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    _animationRight = Tween<Offset>(
      begin: Offset(2.0, 0.0),
      end: Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _animationCenterToLeft = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleForwardButton() {
    if (_currentIndex < 3) {
      setState(() {
        _currentIndex++;
      });
      _controller.reset();
      _controller.forward();
    }
  }

  void _handleBackButton() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Left Image
            SlideTransition(
              position: _animationLeft,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Center(
                  child: Text(
                    'Image ${_currentIndex}',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // CenterToRight Image
            SlideTransition(
                position: _animationCenterToRight,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: Center(
                    child: Text(
                      'Image ${_currentIndex}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            // Right Image
            SlideTransition(
              position: _animationRight,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Center(
                  child: Text(
                    'Image ${_currentIndex + 2}',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // CenterToLeft Image
            SlideTransition(
              position: _animationCenterToLeft,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Center(
                  child: Text(
                    'Image ${_currentIndex + 1}',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _handleBackButton,
            child: Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
            onPressed: _handleForwardButton,
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
