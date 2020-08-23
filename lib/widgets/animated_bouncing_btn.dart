import 'package:flutter/material.dart';

class AnimatedBouncingButton extends StatefulWidget {
  const AnimatedBouncingButton({Key key, this.text}) : super(key: key);

  final text;

  @override
  _AnimatedBouncingButtonState createState() =>
      _AnimatedBouncingButtonState(text);
}

class _AnimatedBouncingButtonState extends State<AnimatedBouncingButton>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  _AnimatedBouncingButtonState(this.textContent);

  final String textContent;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  Widget get _animatedButtonUI => Container(
        height: 40,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [
              BoxShadow(
                color: Color(0x80000000),
                blurRadius: 30.0,
                offset: Offset(0.0, 5.0),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF09995C),
                Color(0xFF09995C),
                Color(0xFF38ef7d),
              ],
            )),
        child: Center(
          child: Text(
            textContent,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      );
}
