import 'package:flutter/material.dart';

class TopButtonWithPadding extends StatelessWidget {
  TopButtonWithPadding({this.size, this.child, this.padding, this.onPressed});

  final Size size;
  final child;
  final padding;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: size.height * 0.09,
        width: size.width * 0.9,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.white, // background
            onPrimary: Colors.green, // foreground
          ),
          child: child,
        ),
      ),
    );
  }
}
