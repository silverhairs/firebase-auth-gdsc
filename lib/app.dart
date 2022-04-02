import 'package:chatting/home_page.dart';
import 'package:chatting/login_page.dart';
import 'package:chatting/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // We are listening to changes from `UserChangeNotifier` then returning the
      // correct page.
      home: Consumer<UserChangeNotifier>(
        builder: (context, listenable, _) {
          // If our listenable does have a user yet, we should open the login
          // page in order to login and get a user.
          if (listenable.user == null) {
            return const LoginPage();
          }
          // if our listenable has user already, we should open the home page
          // because we already have a user so there is no need to delay.
          return const HomePage();
        },
      ),
    );
  }
}
