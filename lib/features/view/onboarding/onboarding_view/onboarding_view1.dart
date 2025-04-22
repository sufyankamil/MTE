import 'package:flutter/material.dart';

import 'onboarding_view2.dart';

class OnboardingView1 extends StatelessWidget {
  const OnboardingView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/image1.png"),
                const SizedBox(height: 20),
                Text(
                  "Gain total control \n of your money",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33.0),
                  child: Text(
                    "Become your own money manager \n and make every cent count",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 30,
            right: 30,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingView2(),
                  ),
                );
              },
              child: Text(
                "Next",
                style: TextStyle(
                  color: Color(0XFF7F3DFF),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
