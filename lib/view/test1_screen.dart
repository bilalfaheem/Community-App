import 'dart:async';

import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/material.dart';
//   begin: Offset.zero,
//   end: Offset(-1.0, 0.0),
// ).animate(_controller);

// _animationRight = Tween<Offset>(
//   begin: Offset(2.0, 0.0),
//   end: Offset(1.0,0.0),
import 'package:flutter/material.dart';

class MyAnimationWidget extends StatefulWidget {
  @override
  _MyAnimationWidgetState createState() => _MyAnimationWidgetState();
}

var v = [1, 2, 3, 4];

int left = 0;
int cent = 1;
int right = 2;

class _MyAnimationWidgetState extends State<MyAnimationWidget>
    with SingleTickerProviderStateMixin {
  Offset centerPosition = Offset(0.9, 0);
  Offset leftPosition = Offset(-3, 0);
  Offset rightPosition = Offset(3.0, 0);

  late AnimationController _controller;
  late Animation<Offset> _animationLeft;
  late Animation<Offset> _animationRight;

  late Animation<Offset> _animationCenterRight;
  late Animation<Offset> _animationLeftCenter;

  late Animation<Offset> _firstAnimation;
  late Animation<Offset> _secondAnimation;

  void forwardFunc() {
    // _controller.reset();
    _firstAnimation = _animationLeft;
    _secondAnimation = _animationRight;
    _controller.forward();
    Timer(Duration(seconds: 3), () {
      if (_controller.isCompleted) {
        setState(() {
          _controller.reset();
          left = cent;
          cent = right;
          right++;
        });
      }
    });
  }

  void backwardFunc() {
    // _controller.reset();
    _firstAnimation = _animationCenterRight;
    _secondAnimation = _animationLeftCenter;
    _controller.forward();
    Timer(Duration(seconds: 3), () {
      if (_controller.isCompleted) {
        setState(() {
          _controller.reset();
          left = cent;
          cent = right;
          right++;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    left = 0;
    cent = 1;
    right = 2;
    // Set up the animation controller with a duration of 2 seconds
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Define the animations for the left and right images
    _animationLeft = Tween<Offset>(
      begin: centerPosition,
      end: leftPosition,
    )
        .chain(
          CurveTween(curve: Curves.bounceOut),
        )
        .animate(_controller);

    _animationRight = Tween<Offset>(
      begin: rightPosition,
      end: centerPosition,
    )
        .chain(
          CurveTween(curve: Curves.bounceOut),
        )
        .animate(_controller);

    _animationCenterRight = Tween<Offset>(
      begin: centerPosition,
      end: rightPosition,
    )
        .chain(
          CurveTween(curve: Curves.bounceOut),
        )
        .animate(_controller);

    _animationLeftCenter = Tween<Offset>(
      begin: leftPosition,
      end: centerPosition,
    )
        .chain(
          CurveTween(curve: Curves.bounceOut),
        )
        .animate(_controller);

    _firstAnimation = _animationLeft;
    _secondAnimation = _animationRight;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Left Image
            SlideTransition(
              position: _firstAnimation,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Content(data: cent.toString(), size: 15),
              ),
            ),
            // Right Image
            SlideTransition(
              position: _secondAnimation,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Content(data: right.toString(), size: 15),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              forwardFunc();
            },
            child: Icon(Icons.play_arrow),
          ),
          ElevatedButton(
            onPressed: () {
              backwardFunc();
              // _controller.reverse();
            },
            child: Icon(Icons.arrow_back),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// import 'package:flutter/material.dart';

// class MyAnimationWidget extends StatefulWidget {
//   @override
//   _MyAnimationWidgetState createState() => _MyAnimationWidgetState();
// }

// class _MyAnimationWidgetState extends State<MyAnimationWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animationLeft;
//   late Animation<Offset> _animationRight;

//   @override
//   void initState() {
//     super.initState();

//     // Set up the animation controller with a duration of 2 seconds
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     // Define the animations for the left and right images with a bouncy curve
//     _animationLeft = Tween<Offset>(
//       begin: Offset(0.9,0),
//       end: Offset(-1.0, 0.0),
//     ).chain(
//       CurveTween(curve: Curves.elasticOut),
//     ).animate(_controller);

//     _animationRight = Tween<Offset>(
//       begin: Offset(3.0, 0.0),
//       end: Offset(0.9,0.0),
//     ).chain(
//       CurveTween(curve: Curves.elasticOut),
//     ).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Left Image
//             SlideTransition(
//               position: _animationLeft,
//               child: Container(
//                 width: 150,
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(75),
//                 ),
//               ),
//             ),
//             // Right Image
//             SlideTransition(
//               position: _animationRight,
//               child: Container(
//                 width: 150,
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(75),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _controller.reset();
//           _controller.forward();
//         },
//         child: Icon(Icons.play_arrow),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class MyAnimationWidget extends StatefulWidget {
//   @override
//   _MyAnimationWidgetState createState() => _MyAnimationWidgetState();
// }

// class _MyAnimationWidgetState extends State<MyAnimationWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animationLeft;
//   late Animation<Offset> _animationRight;

//   @override
//   void initState() {
//     super.initState();

//     // Set up the animation controller with a duration of 2 seconds
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     // Define the animations for the left and right images
//     _animationLeft = Tween<Offset>(
//       begin: Offset(0.9,0),
//       end: Offset(-1.0, 0.0),
//     ).animate(_controller);

//     _animationRight = Tween<Offset>(
//       begin: Offset(3.0, 0.0),
//       end: Offset(0.9,0.0),
//     ).animate(_controller);

//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Left Image
//             SlideTransition(
//               position: _animationLeft,
//               child: Container(
//                 width: 150,
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(75),
//                 ),
//               ),
//             ),
//             // Right Image
//             SlideTransition(
//               position: _animationRight,
//               child: Container(
//                 width: 150,
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(75),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _controller.reset();
//           _controller.forward();
//         },
//         child: Icon(Icons.play_arrow),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
