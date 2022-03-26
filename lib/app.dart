import 'package:chatting/home_page.dart';
import 'package:chatting/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Connection Error'),
                content: const Text(
                  'Please make sure you are connected to internet',
                ),
                actions: [
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('OK'),
                  )
                ],
              ),
            );
          }

          if (snapshot.hasData) {
            final user = snapshot.data;
            if (user != null) {
              return HomePage(user: user);
            }
          }

          return const LoginPage();
        },
      ),
    );
  }
}
