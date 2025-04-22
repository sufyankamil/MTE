import 'package:flutter/material.dart';
import 'package:montra_expense_tracker/common/success/success_screen.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pinput/pinput.dart';

class SetPinView extends StatefulWidget {
  const SetPinView({super.key});

  @override
  State<SetPinView> createState() => _SetPinViewState();
}

class _SetPinViewState extends State<SetPinView> {
  final TextEditingController _pinController = TextEditingController();

  final FocusNode _focusNode = FocusNode();


  void _onKeyboardTap(String value) {
    if (_pinController.text.length < 4) {
      setState(() {
        _pinController.text += value;
      });
    }
  }

  void _onBackspace() {
    if (_pinController.text.isNotEmpty) {
      setState(() {
        _pinController.text = _pinController.text.substring(
          0,
          _pinController.text.length - 1,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var focusedBorderColor = Colors.grey[500];

    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    const borderColor = Color(0xFFCE93D8);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: Colors.white),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0XFF7F3DFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 55,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Let's set your PIN",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Pinput(
              length: 4,
              controller: _pinController,
              focusNode: _focusNode,
              keyboardType: TextInputType.none,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: focusedBorderColor!),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
            ),
            Spacer(),
            NumericKeyboard(
              onKeyboardTap: _onKeyboardTap,
              textColor: Colors.white,
              rightIcon: const Icon(Icons.backspace, color: Colors.white),
              rightButtonFn: _onBackspace,
            ),

            ElevatedButton.icon(
              onPressed: () {
                final pin = _pinController.text;
                if (pin.length == 4) {
                  debugPrint('PIN entered: $pin');

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessScreen(
                        text: 'PIN Set Successfully',
                        routeName: '/accountSetup',
                      ),
                    ),
                  );

                } else {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a 4-digit PIN')),
                  );
                }
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
