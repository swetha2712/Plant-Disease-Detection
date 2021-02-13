import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPressed, this.title, this.icon});

  final Function onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(10.0),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
