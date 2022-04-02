import 'package:chatting/user_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNotifier = context.read<UserChangeNotifier>();
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome to your account, ${userNotifier.user?.displayName!}',
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () async {
              // When the user presses the button, we want to start
              // asynchronously the signing out process in Firebase servers and
              // at we need to notify our listeners that the user pressed the
              // logout button; the action assigned to this button is loging out.
              // So we should call the `logout()` method on our listenable(UserChangeNotifier),
              // then the method will notify the listeners about this action.
              //
              // The `userNotifier.logOut()` code is syncrhonouse, so it will
              //  finish running before `await FirebaseAuth.instance.signOut();`
              // which is asynchronous, simply put: the listenable will be informed
              // of the logout before the logout is executed, then the `Consumer`
              // in our `App` widget will act accordingly
              //(by showing the LoginPage instead).
              await FirebaseAuth.instance.signOut();
              userNotifier.logOut();
            },
            child: const Text('Loug Out'),
          )
        ],
      ),
    );
  }
}
