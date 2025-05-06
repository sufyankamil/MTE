import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:montra_expense_tracker/common/constants.dart';
import 'package:montra_expense_tracker/features/view/posts/user_posts.dart';

import 'common/success/success_screen.dart';
import 'features/model/post_adapter_hive.dart';
import 'features/view/home/home_view.dart';
import 'features/view/onboarding/account-setup/account_setup.dart';
import 'features/view/onboarding/add_new_account/add_new_account.dart';
import 'features/view/onboarding/set-pin/set_pin_view.dart';
import 'features/view/onboarding/splash/splash_screen_view.dart';
import 'features/view/profile/user_detail_view.dart';

void main() async{
  await initHiveForFlutter();
  Hive.registerAdapter(PostsAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FlexColorScheme.light(scheme: FlexScheme.deepPurple).toTheme;
    final darkTheme = FlexColorScheme.dark(scheme: FlexScheme.purpleM3).toTheme;

    final HttpLink httpLink = HttpLink(
      Constants.postsUrl,
    );

    final GraphQLClient client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    );

    final ValueNotifier<GraphQLClient> clientNotifier = ValueNotifier(client);

    return GraphQLProvider(
      client: clientNotifier,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: theme,
        darkTheme: darkTheme,
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
          '/posts': (context) => const UserPosts(), // UserPosts() // GraphUserPosts(),
          '/success': (context) => const SuccessScreen(text: "Success", routeName: '',),
        },
      ),
    );
  }
}
