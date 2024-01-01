import 'package:calling/components/rounded_button.dart';
import 'package:calling/constants.dart';
import 'package:calling/size_config.dart';
import 'package:flutter/material.dart';
import 'package:calling/screens/dialScreen/dial_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Image
        Image.asset(
          "assets/images/full_image.png",
          fit: BoxFit.cover,
        ),
        // Black Layer
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/adotIcon.png',
                        width: 25,
                        height: 25,
                      ),
                    ),
                    SizedBox(
                        width: 4.0), // Add some spacing between icon and text
                    Text(
                      "에이닷 음성 통화...".toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(1.0),
                      ),
                    ),
                  ],
                ),
                VerticalSpacing(of: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "010-1234-1234",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RoundedButton(
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DialScreen()),
                              );
                            },
                            color: kRedColor,
                            iconColor: Colors.white,
                            iconSrc: "assets/icons/call_end.svg",
                          ),
                          VerticalSpacing(of: 3),
                          Text(
                            "거절".toUpperCase(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withOpacity(1.0),
                            ),
                          ),
                        ]),
                    HorizontalSpacing(of: 10),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RoundedButton(
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DialScreen()),
                              );
                            },
                            color: kGreenColor,
                            iconColor: Colors.white,
                            iconSrc: "assets/icons/call_start.svg",
                          ),
                          VerticalSpacing(of: 3),
                          Text(
                            "응답".toUpperCase(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withOpacity(1.0),
                            ),
                          ),
                        ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
