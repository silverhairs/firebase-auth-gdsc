import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.user, Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Welcome to your account, ${user.displayName!}'),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: const Text('Loug Out'),
          )
        ],
      ),
    );
  }
}
