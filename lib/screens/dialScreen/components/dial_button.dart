import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class DialButton extends StatefulWidget {
  // Define the fields that you expect to pass into DialButton, if any.
  // For instance, if you want to pass in text and iconSrc, you'd define them like this:
  final String iconSrc;
  final String text;
  final VoidCallback press;

  const DialButton({
    Key? key,
    required this.iconSrc,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  _DialButtonState createState() => _DialButtonState();
}

class _DialButtonState extends State<DialButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(120),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(20),
          ),
        ),
        onPressed: widget.press,
        child: Column(
          children: [
            SvgPicture.asset(
              widget.iconSrc,
              color: Colors.white,
              height: 36,
            ),
            VerticalSpacing(of: 5),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
    );
  }
}
