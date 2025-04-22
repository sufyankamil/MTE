import 'package:flutter/material.dart';
import 'package:montra_expense_tracker/features/view/onboarding/onboarding_view/onbaording_view3.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/image4.png"),
                const SizedBox(height: 20),
                Text(
                  "Know where your \n money goes",
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
                    "Track your transaction easily, \n with categories and financial report",
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
            left: 30,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Prev",
                style: TextStyle(
                  color: Color(0XFF7F3DFF),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
                    builder: (context) => const OnboardingView3(),
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
