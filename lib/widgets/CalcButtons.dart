import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButtons extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callback;

  const CalcButtons({
    Key key,
    this.text,
    this.fillColor,
    this.textColor = 0xFFffffffff,
    this.textSize = 24,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(15),
      child: SizedBox(
        height: 65,
        width: 65,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
              fontSize: textSize,
            )),
          ),
          onPressed: () {
            callback(text);
          },
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
