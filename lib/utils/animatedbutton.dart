// import 'package:flutter/material.dart';

// class AnimatedButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: PulsatingCircleIconButton(
//           onTap: () {},
//           icon: Icon(
//             Icons.monetization_on,
//             color: Colors.blueGrey,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PulsatingCircleIconButton extends StatefulWidget {
//   const PulsatingCircleIconButton({
//     Key key,
//     @required this.onTap,
//     @required this.icon,
//   }) : super(key: key);

//   final GestureTapCallback onTap;
//   final Icon icon;

//   @override
//   _PulsatingCircleIconButtonState createState() =>
//       _PulsatingCircleIconButtonState();
// }

// class _PulsatingCircleIconButtonState extends State<PulsatingCircleIconButton>
//     with SingleTickerProviderStateMixin {
//   AnimationController _animationController;
//   Animation _animation;

//   @override
//   void initState() {
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 2));
//     _animation = Tween(begin: 0.0, end: 12.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//     );
//     _animationController.repeat(reverse: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(100),
//       onTap: widget.onTap,
//       child: AnimatedBuilder(
//         animation: _animation,
//         builder: (context, _) {
//           return Ink(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//               boxShadow: [
//                 for (int i = 1; i <= 2; i++)
//                   BoxShadow(
//                     color: Colors.white
//                         .withOpacity(_animationController.value / 2),
//                     spreadRadius: _animation.value * i,
//                   )
//               ],
//             ),
//             child: widget.icon,
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class BouncingButton extends StatefulWidget {
//   @override
//   _BouncingButtonState createState() => _BouncingButtonState();
// }

// class _BouncingButtonState extends State<BouncingButton>
//     with SingleTickerProviderStateMixin {
//   double _scale;
//   AnimationController _controller;
//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(
//         milliseconds: 500,
//       ),
//       lowerBound: 0.0,
//       upperBound: 0.1,
//     )..addListener(() {
//         setState(() {});
//       });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _scale = 1 - _controller.value;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Bouncing Button Animation Demo"),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Press the Below Button',
//             style: TextStyle(color: Colors.grey[400], fontSize: 20.0),
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           Center(
//             child: GestureDetector(
//               onTapDown: _tapDown,
//               onTapUp: _tapUp,
//               child: Transform.scale(
//                 scale: _scale,
//                 child: _animatedButton(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _animatedButton() {
//     return Container(
//       height: 70,
//       width: 200,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100.0),
//           boxShadow: [
//             BoxShadow(
//               color: Color(0x80000000),
//               blurRadius: 12.0,
//               offset: Offset(0.0, 5.0),
//             ),
//           ],
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xff33ccff),
//               Color(0xffff99cc),
//             ],
//           )),
//       child: Center(
//         child: Text(
//           'Press',
//           style: TextStyle(
//               fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//       ),
//     );
//   }

//   void _tapDown(TapDownDetails details) {
//     _controller.forward();
//   }

//   void _tapUp(TapUpDetails details) {
//     _controller.reverse();
//   }
// }

import 'package:flutter/material.dart';

class AnimatedBalloon extends StatefulWidget {
  const AnimatedBalloon({Key key}) : super(key: key);

  @override
  _AnimatedBalloonState createState() => _AnimatedBalloonState();
}

class _AnimatedBalloonState extends State<AnimatedBalloon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animationFloatUp;
  Animation<double> _animationGrowSize;

  double _balloonHeight;
  double _balloonWidth;
  double _balloonBottomLocation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _balloonHeight = MediaQuery.of(context).size.height / 2;
    _balloonWidth = MediaQuery.of(context).size.height / 3;
    _balloonBottomLocation =
        MediaQuery.of(context).size.height - _balloonHeight;

    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _animationGrowSize = Tween(begin: 50.0, end: _balloonWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.75, curve: Curves.elasticInOut),
      ),
    );

    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
            left: _animationGrowSize.value * 0.25,
          ),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        child: Image.asset(
          'assets/images/BeginningGoogleFlutter-Balloon.png',
          height: _balloonHeight,
          width: _balloonWidth,
        ),
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}
