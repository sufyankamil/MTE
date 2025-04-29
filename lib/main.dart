import 'package:flutter/material.dart';
import 'package:montra_expense_tracker/features/view/posts/user_posts.dart';

import 'common/success/success_screen.dart';
import 'features/view/home/home_view.dart';
import 'features/view/onboarding/account-setup/account_setup.dart';
import 'features/view/onboarding/add_new_account/add_new_account.dart';
import 'features/view/onboarding/set-pin/set_pin_view.dart';
import 'features/view/onboarding/splash/splash_screen_view.dart';
import 'features/view/profile/user_detail_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M. Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenView(),
        '/home': (context) => const HomeView(),
        '/accountSetup': (context) => const AccountSetup(),
        '/add-new-account': (context) => const AddNewAccount(),
        '/verification': (context) => const SetPinView(),
        '/user-detail': (context) {
          final user = ModalRoute.of(context)!.settings.arguments;
          return UserDetailView(user: user);
        },
        '/posts': (context) => const UserPosts(),
        '/success': (context) => const SuccessScreen(text: "Success", routeName: '',),
      },
    );
  }
}
